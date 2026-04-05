import "./WelcomeScreen.css";

export default function WelcomeScreen() {
  return (
    <div className="welcome">
      <div className="welcome__icon">🏸</div>
      <h2 className="welcome__title">Welcome to ShuttleAI</h2>
      <p className="welcome__subtitle">Click "New Chat" to get started!</p>
    </div>
  );
}