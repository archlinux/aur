# talk to the local llm
import json
import init_gi
from gi.repository import Soup, GLib
from typing import List

async def get_ai_response(app, bubble, thinking_label, messages: List[dict]):
    # send prompt
    payload = {
        "model": app.current_model,
        "messages": messages,
        "stream": True
    }
    
    # retry loop
    for attempt in range(5):
        try:
            msg = Soup.Message.new("POST", f"{app.BASE_URL}/chat/completions")
            msg.set_request_body_from_bytes("application/json", GLib.Bytes.new(json.dumps(payload).encode()))
            
            stream = await app.session.send_async(msg, GLib.PRIORITY_DEFAULT, None)
            
            status = msg.get_status()
            if status == Soup.Status.OK:
                return stream
            
            print(f"Server returned status {status} on attempt {attempt + 1}")
            # hard error
            if status != Soup.Status.NONE and status < 500:
                break
                
        except Exception as e:
            print(f"Connection attempt {attempt + 1} failed: {e}")
            
        if attempt < 4:
            import asyncio
            await asyncio.sleep(1.5)
            
    return None
