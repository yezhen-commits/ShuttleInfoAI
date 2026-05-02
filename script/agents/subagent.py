from dotenv import load_dotenv
from typing import Any, Optional
import os
from langchain.agents import create_agent
from langchain.messages import HumanMessage
from resource.agent_prompt import get_agent_system_prompt
from langchain_openai import OpenAIEmbeddings, ChatOpenAI
from langchain.tools import tool
from pydantic import BaseModel, Field, model_validator
from psycopg2 import pool
from functools import lru_cache
from pgvector.psycopg2 import register_vector
from itertools import permutations
import asyncio
from langchain_community.utilities import SQLDatabase
from langchain_community.agent_toolkits import SQLDatabaseToolkit

load_dotenv()
embeddings_model = OpenAIEmbeddings()
model = ChatOpenAI(model="gpt-5.4-nano")

db = SQLDatabase.from_uri(
    os.getenv("DATABASE_URL"),
    schema="badmintonv2",
    include_tables=["singles_players", "doubles_players", "doubles_pairs"],
    sample_rows_in_table_info=10
)

connection_pool = pool.ThreadedConnectionPool(
    minconn=5,
    maxconn=40,
    dsn=os.getenv("DATABASE_URL"),
    sslmode="require"
)

_init_conn = connection_pool.getconn()
register_vector(_init_conn)
connection_pool.putconn(_init_conn)

@lru_cache(maxsize=100)
def get_embedding(query: str):
    return embeddings_model.embed_query(query)

def get_connection():
    conn = connection_pool.getconn()
    register_vector(conn)
    return conn

def release_connection(conn):
    connection_pool.putconn(conn)

class ProfileSearchQuery(BaseModel):
    query:          str           = Field(...,  description="Natural language question e.g. 'Olympic gold medal'")
    name:           Optional[str] = Field(None, description="Filter by player name")
    content_type:   Optional[str] = Field(None, description="'biography', 'career', or 'achievement'")
    k:              int           = Field(3,    description="Number of results to return, max 8")

    @model_validator(mode="before")
    @classmethod
    def handle_string_input(cls, values: Any) -> Any:
        if isinstance(values, str):
            return {"query": values}
        return values

def search_profile_sync(query: ProfileSearchQuery) -> str:
    """This function is use to find the profile of a specific player, including biography, career and achievements"""
    
    if query.name and "/" in query.name:
        player_names = [n.strip() for n in query.name.split("/")]
        combined_output = []
        for player_name in player_names:
            individual_query = ProfileSearchQuery(
                query=query.query,
                name=player_name,
                content_type=query.content_type,
                k=query.k
            )
            result = search_profile_sync(individual_query)
            if "No profile" not in result and "Error" not in result:
                combined_output.append(result)
        return "\n\n".join(combined_output) if combined_output else "No profile information found."

    conn = get_connection()
    cursor = None
    try:
        cursor = conn.cursor()
        query_vector = get_embedding(query.query)

        sql = """
            SELECT name, content_type, content,
                1 - (embedding <=> %s::vector) AS similarity
            FROM badminton.player_profiles
            WHERE 1=1
        """
        params = [query_vector]

        if query.content_type:
            sql += " AND content_type = %s"
            params.append(query.content_type)

        if query.name:
            clean_name = query.name.replace(",", "").strip()
            name_parts = clean_name.split()
            conditions = []
            conditions.append("name ILIKE %s")
            params.append(f"%{clean_name}%")
            for perm in permutations(name_parts):
                permuted_name = " ".join(perm)
                if permuted_name != clean_name:
                    conditions.append("name ILIKE %s")
                    params.append(f"%{permuted_name}%")
            sql += f" AND ({' OR '.join(conditions)})"

        sql += " ORDER BY similarity DESC LIMIT %s"
        params.append(min(query.k, 8))

        cursor.execute(sql, params)
        rows = cursor.fetchall()

        if not rows:
            return "No profile information found."

        output = []
        for name_, content_type_, content_, similarity_ in rows:
            output.append(
                f"[{content_type_.upper()}] {name_} (similarity: {similarity_:.2f}):\n{content_}\n"
            )
        return "\n".join(output)
    except Exception as e:
        return f"Error searching profiles: {str(e)}"
    finally:
        if cursor:
            cursor.close()
        release_connection(conn)

@tool
async def search_profile(query: ProfileSearchQuery) -> str:
    """Use this tool to find biography, career history and achievements of a specific player using semantic search"""
    return await asyncio.to_thread(search_profile_sync, query)

database_prompt, answer_creation_prompt, manager_prompt = get_agent_system_prompt()
toolkit = SQLDatabaseToolkit(db=db, llm=model)
sql_tools = toolkit.get_tools()

search_web_agent = None

database_agent = create_agent(
    model="gpt-5.4-nano",
    tools=sql_tools + [search_profile], 
    system_prompt=database_prompt
)

answer_creation_agent = create_agent(
    model="gpt-5.4-nano",
    system_prompt=answer_creation_prompt
)

@tool
async def call_search_web_agent(x: str):
    """call search_web_agent to find badminton info from the web"""
    response = await search_web_agent.ainvoke({"messages": [HumanMessage(content=f"Search for {x}")]})
    return response["messages"][-1].content

@tool
async def call_database_agent(x: str):
    """call database agent for player info like rankings, points, country, biography"""
    response = await database_agent.ainvoke({"messages": [HumanMessage(content=f"Search for {x}")]})
    return response["messages"][-1].content

@tool
async def call_answer_creation_agent(x: str):
    """call answer creation agent to form the final answer"""
    response = await answer_creation_agent.ainvoke({"messages": [HumanMessage(content=x)]})
    return response["messages"][-1].content