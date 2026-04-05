import { useState, useEffect } from "react";

import Sidebar    from "./components/Sidebar";
import TopBar     from "./components/TopBar";
import ChatWindow from "./components/ChatWindow";
import InputBar   from "./components/InputBar";

import type { Chat, Message } from "../types";
import "./App.css";

const API   = import.meta.env.VITE_API_URL;

const genId = (): string =>
  `thread_${Date.now()}_${Math.random().toString(36).slice(2, 6)}`;

export default function App() {
  const [chats, setChats]               = useState<Chat[]>([]);
  const [activeChatId, setActiveChatId] = useState<string | null>(genId());
  const [messages, setMessages]         = useState<Message[]>([]);
  const [message, setMessage]           = useState<string>("");
  const [loading, setLoading]           = useState<boolean>(false);

  useEffect(() => {
    fetch(`${API}/api/chats`)
      .then((r) => r.json())
      .then((data: Chat[]) => setChats(data))
      .catch(console.error);
  }, []);

  const switchChat = async (threadId: string): Promise<void> => {
    setActiveChatId(threadId);
    setMessages([]);
    const res        = await fetch(`${API}/api/chats/${threadId}/messages`);
    const data: Message[] = await res.json();
    setMessages(data);
  };

  const createNewChat = (): void => {
    setActiveChatId(genId());
    setMessages([]);
    setMessage("");
  };

  const deleteChat = async (
    e: React.MouseEvent<HTMLButtonElement>,
    threadId: string
  ): Promise<void> => {
    e.stopPropagation();
    await fetch(`${API}/api/chats/${threadId}`, { method: "DELETE" });
    setChats((prev) => prev.filter((c) => c.thread_id !== threadId));
    if (activeChatId === threadId) {
      setActiveChatId(genId());
      setMessages([]);
    }
  };

  const sendMessage = async (): Promise<void> => {
    if (!message.trim() || !activeChatId || loading) return;

    const text     = message;
    const threadId = activeChatId;

    setMessages((prev) => [
      ...prev,
      { role: "user",      content: text },
      { role: "assistant", content: ""   },
    ]);
    setMessage("");
    setLoading(true);

    try {
      const res = await fetch(`${API}/api/chat/stream`, {
        method:  "POST",
        headers: { "Content-Type": "application/json" },
        body:    JSON.stringify({ message: text, thread_id: threadId }),
      });

      if (!res.body) throw new Error("No response body");

      const reader  = res.body.getReader();
      const decoder = new TextDecoder();

      while (true) {
        const { done, value } = await reader.read();
        if (done) break;

        for (const line of decoder.decode(value).split("\n")) {
          if (!line.startsWith("data: ")) continue;
          const raw = line.replace("data: ", "");
          if (raw === "[DONE]") break;

          const parsed = JSON.parse(raw) as { token?: string; error?: string };
          if (parsed.error) throw new Error(parsed.error);

          if (parsed.token) {
            setMessages((prev) => {
              const updated = [...prev];
              const last    = updated[updated.length - 1];
              updated[updated.length - 1] = {
                ...last,
                content: last.content + parsed.token,
              };
              return updated;
            });
          }
        }
      }

      const updatedChats: Chat[] = await fetch(`${API}/api/chats`).then((r) => r.json());
      setChats(updatedChats);

    } catch (err) {
      console.error(err);
      setMessages((prev) => {
        const updated = [...prev];
        updated[updated.length - 1] = {
          ...updated[updated.length - 1],
          content: "⚠️ Error connecting to backend.",
        };
        return updated;
      });
    }

    setLoading(false);
  };

  const activeTitle =
    chats.find((c) => c.thread_id === activeChatId)?.title ?? "New Chat";

  return (
    <div className="app-container">
      <Sidebar
        chats={chats}
        activeChatId={activeChatId}
        onNewChat={createNewChat}
        onSelectChat={switchChat}
        onDeleteChat={deleteChat}
      />
      <div className="app-main">
        <TopBar title={activeTitle} />
        <ChatWindow
          activeChatId={activeChatId}
          messages={messages}
          loading={loading}
        />
        <InputBar
          message={message}
          loading={loading}
          activeChatId={activeChatId}
          onChange={setMessage}
          onSend={sendMessage}
        />
      </div>
    </div>
  );
}