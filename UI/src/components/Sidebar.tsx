import type { Chat } from "../../types";
import "./Sidebar.css";

interface SidebarProps {
  chats:        Chat[];
  activeChatId: string | null;
  onNewChat:    () => void;
  onSelectChat: (threadId: string) => void;
  onDeleteChat: (e: React.MouseEvent<HTMLButtonElement>, threadId: string) => void;
}

export default function Sidebar({
  chats,
  activeChatId,
  onNewChat,
  onSelectChat,
  onDeleteChat,
}: SidebarProps) {
  return (
    <div className="sidebar">

      <div className="sidebar__logo">
        <span className="sidebar__logo-icon">🏸</span>
        <span className="sidebar__logo-text">ShuttleInfo AI</span>
      </div>

      <button className="sidebar__new-button" onClick={onNewChat}>
        New Chat
      </button>

      {chats.length === 0 && (
        <p className="sidebar__empty">No chats yet</p>
      )}

      <div className="sidebar__list">
        {chats.map((chat) => (
          <div
            key={chat.thread_id}
            onClick={() => onSelectChat(chat.thread_id)}
            className={`sidebar__chat-item ${chat.thread_id === activeChatId ? "sidebar__chat-item--active" : ""}`}
          >
            <span className={`sidebar__chat-title ${chat.thread_id === activeChatId ? "sidebar__chat-title--active" : ""}`}>
              💬 {chat.title}
            </span>
            <button
              className="sidebar__delete-button"
              onClick={(e) => onDeleteChat(e, chat.thread_id)}
            >
              ✕
            </button>
          </div>
        ))}
      </div>

    </div>
  );
}