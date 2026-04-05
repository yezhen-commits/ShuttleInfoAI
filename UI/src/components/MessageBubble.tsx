// src/components/MessageBubble.tsx
import type React from "react";
import type { Message } from "../../types";
import "./MessageBubble.css";

interface MessageBubbleProps {
  message:     Message;
  isStreaming: boolean;
}
function renderInline(text: string) {
  const parts = text.split(/(\*\*.*?\*\*)/g);
  return parts.map((part, i) => {
    if (part.startsWith("**") && part.endsWith("**")) {
      return <strong key={i}>{part.slice(2, -2)}</strong>;
    }
    return <span key={i}>{part}</span>;
  });
}

function renderMarkdown(content: string): React.ReactElement[] {
  const lines = content.split("\n");
  const elements: React.ReactElement[] = [];
  let listItems: React.ReactElement[] = [];
  let key = 0;

  const flushList = () => {
    if (listItems.length > 0) {
      elements.push(<ul key={key++} className="md-list">{listItems}</ul>);
      listItems = [];
    }
  };

  for (const line of lines) {
    const trimmed = line.trim();

    const headingMatch = trimmed.match(/^(#{1,3})\s+(.*)$/);
    if (headingMatch) {
      flushList();
      const level = headingMatch[1].length;
      const text  = headingMatch[2];
      const sizes: Record<number, string> = { 1: "18px", 2: "16px", 3: "15px" };
      elements.push(
        <p key={key++} style={{ fontWeight: 700, fontSize: sizes[level], margin: "8px 0 4px 0" }}>
          {renderInline(text)}
        </p>
      );
      continue;
    }

    const bulletMatch = trimmed.match(/^[\*\-]\s+(.*)$/);
    if (bulletMatch) {
      listItems.push(
        <li key={key++} className="md-list-item">
          {renderInline(bulletMatch[1])}
        </li>
      );
      continue;
    }

    flushList();

    if (trimmed === "") {
      // Empty line — small gap
      elements.push(<div key={key++} className="md-spacer" />);
    } else {
      elements.push(
        <p key={key++} className="md-paragraph">
          {renderInline(trimmed)}
        </p>
      );
    }
  }

  flushList();

  return elements;
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
          renderMarkdown(message.content)
        )}
      </div>
    </div>
  );
}