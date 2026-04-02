export interface Chat {
  thread_id:  string;
  title:      string;
  created_at: string;
}

export interface Message {
  role:    "user" | "assistant";
  content: string;
}
