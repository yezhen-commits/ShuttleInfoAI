import type { Message } from "../types";
import "./MessageBubble.css";

interface MessageBubbleProps {
  message:     Message;
  isStreaming: boolean;
}

export default function MessageBubble({ message, isStreaming }: MessageBubbleProps) {
  const isUser = message.role === "user";

  return (
    <div className={`message-bubble ${isUser ? "message-bubble--user" : "message-bubble--assistant"}`}>
      <div className={`message-bubble__content ${isUser ? "message-bubble__content--user" : "message-bubble__content--assistant"}`}>
        {isStreaming && !message.content ? (
          <div className="typing-indicator">
            <span /><span /><span />
          </div>
        ) : (
          message.content
        )}
      </div>
    </div>
  );
}