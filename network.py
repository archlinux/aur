"""
Module for API network interactions.
Manages asynchronous communication with the local LLM server.
"""
import json
import gi
gi.require_version("Soup", "3.0")
from gi.repository import Soup, GLib
from typing import List

async def get_ai_response(app, bubble, thinking_label, messages: List[dict]):
    """Prepares and executes the chat completion request with connection retry."""
    payload = {
        "model": app.current_model,
        "messages": messages,
        "stream": True
    }
    
    # Try multiple times to connect, as some models take time to bind the port
    for attempt in range(5):
        try:
            msg = Soup.Message.new("POST", f"{app.BASE_URL}/chat/completions")
            msg.set_request_body_from_bytes("application/json", GLib.Bytes.new(json.dumps(payload).encode()))
            
            stream = await app.session.send_async(msg, GLib.PRIORITY_DEFAULT, None)
            
            status = msg.get_status()
            if status == Soup.Status.OK:
                return stream
            
            print(f"Server returned status {status} on attempt {attempt + 1}")
            # If it's a 404 or other non-retriable error, we might want to break early
            if status != Soup.Status.NONE and status < 500:
                break
                
        except Exception as e:
            print(f"Connection attempt {attempt + 1} failed: {e}")
            
        if attempt < 4:
            import asyncio
            await asyncio.sleep(1.5)
            
    return None
