import { useEffect, useRef } from "react";
import type { Message } from "../../types";
import MessageBubble  from "./MessageBubble";
import WelcomeScreen  from "./WelcomeScreen";
import "./ChatWindow.css";

interface ChatWindowProps {
  activeChatId: string | null;
  messages:     Message[];
  loading:      boolean;
}

export default function ChatWindow({ activeChatId, messages, loading }: ChatWindowProps) {
  const bottomRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    bottomRef.current?.scrollIntoView({ behavior: "smooth" });
  }, [messages, loading]);

  if (!activeChatId) {
    return (
      <div className="chat-window">
        <WelcomeScreen />
      </div>
    );
  }

  if (messages.length === 0) {
    return (
      <div className="chat-window">
        <p className="chat-window__empty">Ask your first badminton question below.</p>
      </div>
    );
  }

  return (
    <div className="chat-window">
      {messages.map((msg, i) => (
        <MessageBubble
          key={i}
          message={msg}
          isStreaming={loading && i === messages.length - 1 && msg.role === "assistant"}
        />
      ))}
      <div ref={bottomRef} />
    </div>
  );
}