from dotenv import load_dotenv
from pprint import pprint
from typing import List, Any, Optional, Dict
from tavily import TavilyClient
import os
import wikipedia as wk
from langchain.agents import create_agent
from langchain.messages import HumanMessage,AIMessage
from resource.agent_prompt import get_agent_system_prompt
from pymongo.mongo_client import MongoClient
from pymongo.server_api import ServerApi
from langchain_mongodb import MongoDBAtlasVectorSearch
from langchain_openai import OpenAIEmbeddings
from langchain.tools import tool

load_dotenv()
search_engine = TavilyClient()

mongo_uri = os.getenv("MONGODB_ATLAS_CLUSTER_URI")
# Create a new client and connect to the server
client = MongoClient(mongo_uri, server_api=ServerApi('1'))

db = client.bwf_rankings
collection = db.rankings
embeddings = OpenAIEmbeddings()

index_name = "vector_index_1"
vector_store = MongoDBAtlasVectorSearch(
    collection=collection,
    embedding=embeddings,
    index_name=index_name,
    relevance_score_fn="cosine",
)

CATEGORY_MAP = {
    "men singles": "bwf_men_singles_world_ranking",
    "women singles": "bwf_women_singles_world_ranking",
    "men doubles": "bwf_men_doubles_world_ranking",
    "women doubles": "bwf_women_doubles_world_ranking",
    "mixed doubles": "bwf_mixed_doubles_world_ranking",
}

@tool
async def search_badminton_player_info(
    query: str,
    category: Optional[str] = None,
    name: Optional[str] = None,
    pair_name: Optional[str] = None,
    country: Optional[str] = None,
    rank: Optional[int] = None,
    rank_min: Optional[int] = None,
    rank_max: Optional[int] = None,
    points_min: Optional[int] = None,
    points_max: Optional[int] = None,
    k: int = 5
) -> str:
    """
    Search BWF badminton player rankings from the vector database.

    Args:
        query: Natural language question (Example: "top players from Malaysia")
        category: Discipline - one of:
                  'men singles', 'women singles', 'men doubles',
                  'women doubles', 'mixed doubles'
        name: Player name to search (for singles players Example: "Viktor Axelsen")
        pair_name: Pair name to search (for doubles players Example: "Gideon/Sukamuljo")
        country: 3-letter country code (Example: "MAS", "CHN", "INA", "DEN")
        rank: Exact rank to filter (Example: 1 for world number 1)
        rank_min: Minimum rank (Example: 1)
        rank_max: Maximum rank (Example: 10 to get top 10)
        points_min: Minimum ranking points
        points_max: Maximum ranking points
        k: Number of results to return
    """

    pre_filter = {}

    if category:
        db_category = CATEGORY_MAP.get(category.lower())
        if not db_category:
            return f"Invalid category '{category}'. Choose from: {list(CATEGORY_MAP.keys())}"
        pre_filter["category"] = {"$eq": db_category}

    if name:
        pre_filter["name"] = {"$eq": name}

    if pair_name:
        pre_filter["pair_name"] = {"$eq": pair_name}

    if country:
        pre_filter["country"] = {"$eq": country.upper()}

    if rank:
        pre_filter["rank"] = {"$eq": rank}
    else:
        rank_filter = {}
        if rank_min:
            rank_filter["$gte"] = rank_min
        if rank_max:
            rank_filter["$lte"] = rank_max
        if rank_filter:
            pre_filter["rank"] = rank_filter

    points_filter = {}
    if points_min:
        points_filter["$gte"] = points_min
    if points_max:
        points_filter["$lte"] = points_max
    if points_filter:
        pre_filter["points"] = points_filter
        
    try:
        results = vector_store.similarity_search_with_score(
            query=query,
            k=k,
            pre_filter=pre_filter if pre_filter else None
        )
    except Exception as e:
        return f"Search error: {str(e)}"

    if not results:
        return "No players found matching your criteria."

    output = []
    for doc, score in results:
        output.append(f"- {doc.page_content}")

    return "\n".join(output)
        
@tool
async def search_web(query:str)->Dict[str,Any]:
    """
    Use this tool to search the web for information 
    """
    
    return search_engine.search(query)

@tool
async def search_wikipedia(query: str) -> Dict[str, Any]:
    """
    Use this tool to search wikipedia for information such as definition
    """
    try:
        search_results = wk.search(query, results=3)

        if not search_results:
            return {"error": "No results found"}

        results: List[Dict[str, Any]] = []

        for title in search_results:
            try:
                page = wk.page(title)

                results.append({
                    "title": page.title,
                    "summary": page.summary[0:1000]
                })

            except Exception as e:
                print(f"Error: {str(e)}")
                continue

        if not results:
            return {"error": "No valid pages found"}

        return {
            "query": query,
            "results": results
        }

    except Exception as e:
        return {"error": f"Error: {str(e)}"}


search_web_prompt, mongodb_prompt, answer_creation_prompt, manager_prompt = get_agent_system_prompt()

search_web_agent = create_agent(
    model="gpt-5.4-nano",
    tools=[search_wikipedia, search_web],
    system_prompt=search_web_prompt
)

mongodb_agent = create_agent(
    model="gpt-5.4-nano",
    tools=[search_badminton_player_info],
    system_prompt=mongodb_prompt
)

mcp_agent = None

answer_creation_agent = create_agent(
    model="gpt-5.4-mini",
    system_prompt=answer_creation_prompt
)

@tool
async def call_search_web_agent(x: str):
    """call search_web_agent to find badminton info from the web"""
    response = await search_web_agent.ainvoke({"messages": [HumanMessage(content=f"Search for {x}")]})
    return {"messages": [AIMessage(content=response["messages"][-1].content)]}

@tool
async def call_mongodb_agent(x: str):
    """call mongodb_agent for player info like country, birthdate, height"""
    response = await mongodb_agent.ainvoke({"messages": [HumanMessage(content=f"Search for {x}")]})
    return {"messages": [AIMessage(content=response["messages"][-1].content)]}

@tool
async def call_mcp_agent(x: str):
    """call mcp agent for badminton competition info"""
    response = await mcp_agent.ainvoke({"messages": [HumanMessage(content=f"Search for {x}")]})
    return {"messages": [AIMessage(content=response["messages"][-1].content)]}

@tool
async def call_answer_creation_agent(x: str):
    """call answer creation agent to form the final answer"""
    return await answer_creation_agent.ainvoke({"messages": [HumanMessage(content=x)]})