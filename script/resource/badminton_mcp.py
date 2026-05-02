from dotenv import load_dotenv
import os
from mcp.server.fastmcp import FastMCP
from typing import List, Any, Dict
from tavily import TavilyClient
import wikipedia as wk

load_dotenv()
mcp = FastMCP("Badminton_MCP_websearch_server")
search_engine = TavilyClient()

@mcp.tool()
async def search_web(query: str) -> Dict[str, Any]:
    """Use this tool to search the web for information"""
    return search_engine.search(query)

@mcp.tool()
async def search_wikipedia(query: str) -> Dict[str, Any]:
    """Use this tool to search wikipedia for information such as definitions"""
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

        return {"query": query, "results": results}
    except Exception as e:
        return {"error": f"Error: {str(e)}"}

@mcp.prompt()
def prompt():
    """
    Get badminton information from either wikipedia or searching the web using tavily client  
    """
    return"""
    You are an agent that have access to 2 tools, search_wikipedia and search_web here are the rules to use the tools:
    Rueles:
    1. For general badminton questions:
       - Always use search_wikipedia first
       - Use search_web if search_wikipedia either does not provide enough informaiton or search_wikipedia does not have the information or the user asks for more details
       
    2. For product or specification questions such as badminton rackets, shuttlecock or shoes
       - Use search_web only.
       - Do not use search_wikipedia
    
    3. For any question that involves the word "latest", "recent", "current", "new" or "2025" or "2026":
       - Use search_web only
       - Always include "2025" OR "2026" in your search query
       - Only use information from 2025 or 2026 and the event has to have occur
       - If no results from 2025 or 2026 are found, explicitly state:
         "No recent information from 2025-2026 was found for this topic."
       - Use older information as a substitute but state it clearly
       
    4. Always follow these rules
"""

if __name__ =="__main__":
    mcp.run(transport="stdio")