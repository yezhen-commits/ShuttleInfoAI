import "./InputBar.css";

interface InputBarProps {
  message:      string;
  loading:      boolean;
  activeChatId: string | null;
  onChange:     (value: string) => void;
  onSend:       () => void;
}

export default function InputBar({
  message,
  loading,
  activeChatId,
  onChange,
  onSend,
}: InputBarProps) {
  const canSend = message.trim().length > 0 && !!activeChatId && !loading;

  return (
    <div className="input-bar">
      <div className="input-bar__row">
        <input
          className="input-bar__input"
          placeholder={activeChatId ? "Ask a badminton question..." : "Start a new chat first..."}
          value={message}
          disabled={!activeChatId || loading}
          onChange={(e: React.ChangeEvent<HTMLInputElement>) => onChange(e.target.value)}
          onKeyDown={(e: React.KeyboardEvent<HTMLInputElement>) => {
            if (e.key === "Enter") onSend();
          }}
        />
        <button
          className={`input-bar__button ${canSend ? "input-bar__button--active" : "input-bar__button--disabled"}`}
          onClick={onSend}
          disabled={!canSend}
        >
          {loading ? ".  .  .  .  ." : "Send"}
        </button>
      </div>
    </div>
  );
}