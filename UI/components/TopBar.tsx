import "./TopBar.css";

interface TopBarProps {
  title: string;
}

export default function TopBar({ title }: TopBarProps) {
  return (
    <div className="topbar">
      <span className="topbar__title">{title}</span>
    </div>
  );
}