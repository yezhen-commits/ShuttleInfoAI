import psycopg2
import psycopg2.extras
import os
from typing import List, Dict, Any


def get_database() -> psycopg2.extensions.connection:
    """Return a PostgreSQL connection using DATABASE_URL from environment."""
    return psycopg2.connect(
        os.environ.get("DATABASE_URL"),
        sslmode="require"
        )


def start_database() -> None:
    """Create tables if they don't exist. Call once on server start."""
    with get_database() as conn:
        with conn.cursor() as cur:
            cur.execute("""
                CREATE TABLE IF NOT EXISTS chats (
                    thread_id  TEXT PRIMARY KEY,
                    title      TEXT,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                )
            """)
            cur.execute("""
                CREATE TABLE IF NOT EXISTS messages (
                    id         SERIAL PRIMARY KEY,
                    thread_id  TEXT NOT NULL REFERENCES chats(thread_id),
                    role       TEXT NOT NULL,
                    content    TEXT NOT NULL,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                )
            """)
        conn.commit()


def save_chat(thread_id: str, title: str) -> None:
    """Insert a new chat. Ignored if thread_id already exists."""
    with get_database() as conn:
        with conn.cursor() as cur:
            cur.execute(
                "INSERT INTO chats (thread_id, title) VALUES (%s, %s) ON CONFLICT (thread_id) DO NOTHING",
                (thread_id, title)
            )
        conn.commit()


def save_message(thread_id: str, role: str, content: str) -> None:
    """Append a message to a chat thread."""
    with get_database() as conn:
        with conn.cursor() as cur:
            cur.execute(
                "INSERT INTO messages (thread_id, role, content) VALUES (%s, %s, %s)",
                (thread_id, role, content)
            )
        conn.commit()


def get_all_chats() -> List[Dict[str, Any]]:
    """Return all chats ordered by most recent."""
    with get_database() as conn:
        with conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor) as cur:
            cur.execute(
                "SELECT thread_id, title, created_at FROM chats ORDER BY created_at DESC"
            )
            rows = cur.fetchall()
    return [dict(r) for r in rows]


def get_messages_by_thread(thread_id: str) -> List[Dict[str, Any]]:
    """Return all messages for a given thread_id."""
    with get_database() as conn:
        with conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor) as cur:
            cur.execute(
                "SELECT role, content FROM messages WHERE thread_id = %s ORDER BY id ASC",
                (thread_id,)
            )
            rows = cur.fetchall()
    return [dict(r) for r in rows]


def delete_chat_by_thread(thread_id: str) -> None:
    """Delete a chat and all its messages."""
    with get_database() as conn:
        with conn.cursor() as cur:
            cur.execute("DELETE FROM messages WHERE thread_id = %s", (thread_id,))
            cur.execute("DELETE FROM chats    WHERE thread_id = %s", (thread_id,))
        conn.commit()