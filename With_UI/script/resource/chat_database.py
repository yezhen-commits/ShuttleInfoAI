import sqlite3
from typing import List, Dict, Any

DB = "ShuttleInfo_AI.db"

def start_database() -> None:
    """Create tables if they don't exist. Call once on server start."""
    with sqlite3.connect(DB) as conn:
        conn.execute("""
            CREATE TABLE IF NOT EXISTS chats (
                thread_id  TEXT PRIMARY KEY,
                title      TEXT,
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP
            )
        """)
        conn.execute("""
            CREATE TABLE IF NOT EXISTS messages (
                id         INTEGER PRIMARY KEY AUTOINCREMENT,
                thread_id  TEXT NOT NULL,
                role       TEXT NOT NULL,
                content    TEXT NOT NULL,
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                FOREIGN KEY (thread_id) REFERENCES chats(thread_id)
            )
        """)

def get_database() -> sqlite3.Connection:
    conn = sqlite3.connect(DB)
    conn.row_factory = sqlite3.Row
    return conn

def save_chat(thread_id: str, title: str) -> None:
    with get_database() as conn:
        conn.execute(
            "INSERT OR IGNORE INTO chats (thread_id, title) VALUES (?, ?)",
            (thread_id, title)
        )

def save_message(thread_id: str, role: str, content: str) -> None:
    with get_database() as conn:
        conn.execute(
            "INSERT INTO messages (thread_id, role, content) VALUES (?, ?, ?)",
            (thread_id, role, content)
        )

def get_all_chats() -> List[Dict[str, Any]]:
    with get_database() as conn:
        rows = conn.execute(
            "SELECT thread_id, title, created_at FROM chats ORDER BY created_at DESC"
        ).fetchall()
    return [dict(r) for r in rows]

def get_messages_by_thread(thread_id: str) -> List[Dict[str, Any]]:
    with get_database() as conn:
        rows = conn.execute(
            "SELECT role, content FROM messages WHERE thread_id = ? ORDER BY id ASC",
            (thread_id,)
        ).fetchall()
    return [dict(r) for r in rows]

def delete_chat_by_thread(thread_id: str) -> None:
    with get_database() as conn:
        conn.execute("DELETE FROM messages WHERE thread_id = ?", (thread_id,))
        conn.execute("DELETE FROM chats    WHERE thread_id = ?", (thread_id,))