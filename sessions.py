"""
Module for session persistence.
Handles saving, loading, and metadata tracking of chat conversations.
"""
import json
import os
import time

def save_session(app) -> None:
    """Persists current chat history to a JSON file."""
    if not app.history:
        return
        
    if not app.current_session_id:
        app.current_session_id = str(int(time.time()))
    
    title = "Untitled Chat"
    for msg in app.history:
        if msg["role"] == "user":
            title = msg["content"][:40].replace("\n", " ") + (len(msg["content"]) > 40 and "..." or "")
            break
    
    # Preserve existing model if we have one, otherwise fallback
    existing_model = app.current_model if app.current_model else "none"
    
    data = {
        "id": app.current_session_id,
        "title": title,
        "model": existing_model,
        "messages": app.history
    }
    
    path = os.path.join(app.history_dir, f"{app.current_session_id}.json")
    try:
        with open(path, 'w') as f:
            json.dump(data, f)
        
        meta = next((m for m in app.sessions_metadata if m["id"] == app.current_session_id), None)
        if meta:
            if meta["title"] != title or meta["model"] != data["model"]:
                meta["title"] = title
                meta["model"] = data["model"]
                app.update_history_ui()
        else:
            app.sessions_metadata.insert(0, {"id": data["id"], "title": data["title"], "model": data["model"]})
            app.update_history_ui()
    except Exception as e:
        print(f"Error saving session: {e}")

def load_history_metadata(app) -> None:
    """Scans history directory and loads metadata for the sidebar."""
    app.sessions_metadata = []
    if not os.path.exists(app.history_dir):
        return
    files = [f for f in os.listdir(app.history_dir) if f.endswith(".json")]
    files.sort(reverse=True)
    for f in files:
        try:
            path = os.path.join(app.history_dir, f)
            with open(path, 'r') as jf:
                data = json.load(jf)
                app.sessions_metadata.append({
                    "id": data.get("id", f.replace(".json", "")),
                    "title": data.get("title", "Untitled Chat"),
                    "model": data.get("model", "unknown")
                })
        except Exception as e:
            print(f"Error loading session {f}: {e}")
    app.update_history_ui()
