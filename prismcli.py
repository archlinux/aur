#!/usr/bin/env python
import sys
import os
import json
import math
import shutil
import subprocess
import time
import urllib.request
import urllib.error
from datetime import datetime

CONFIG_DIR = os.path.expanduser("~/.config/prism")
HISTORY_DIR = os.path.join(CONFIG_DIR, "history")
CONFIG_FILE = os.path.join(CONFIG_DIR, "config.json")

DEFAULT_CONFIG = {
    "default_model": "llama3:latest",
    "chroma_frequency_scale": 2.0,
    "user_prompt_symbol": "⚡",
    "assistant_name": "PRISM",
    "theme_accent_phase": 1.5,
    "banner_style": "rainbow",  # rainbow, trans, bi, nonbinary, pan, custom
    "intro_animation": "fade", # cascade, fade, none
    "animation_speed": 0.02,
    "custom_colors": ["#FF0000", "#00FF00", "#0000FF"],
    "banner_text": """ ██████╗ ██████╗ ██╗███████╗███╗   ███╗
 ██╔══██╗██╔══██╗██║██╔════╝████╗ ████║
 ██████╔╝██████╔╝██║███████╗██╔████╔██║
 ██╔═══╝ ██╔══██╗██║╚════██║██║╚██╔╝██║
 ██║     ██║  ██║██║███████║██║ ╚═╝ ██║
 ╚═╝     ╚═╝  ╚═╝╚═╝╚══════╝╚═╝     ╚═╝ v1.2"""
}

def load_user_config():
    if not os.path.exists(CONFIG_DIR):
        os.makedirs(CONFIG_DIR, exist_ok=True)
    if not os.path.exists(HISTORY_DIR):
        os.makedirs(HISTORY_DIR, exist_ok=True)
    if not os.path.exists(CONFIG_FILE):
        with open(CONFIG_FILE, "w") as f:
            json.dump(DEFAULT_CONFIG, f, indent=4)
        return DEFAULT_CONFIG
    try:
        with open(CONFIG_FILE, "r") as f:
            return {**DEFAULT_CONFIG, **json.load(f)}
    except Exception:
        return DEFAULT_CONFIG

CFG = load_user_config()

def hex_to_rgb(hex_str):
    hex_str = hex_str.lstrip('#')
    return tuple(int(hex_str[i:i+2], 16) for i in (0, 2, 4))

def get_flag_palette(style_name):
    flags = {
        "trans": ["#5BCEFA", "#F5A9B8", "#FFFFFF", "#F5A9B8", "#5BCEFA"],
        "bi": ["#D60270", "#D60270", "#9B4F96", "#0038A8", "#0038A8"],
        "nonbinary": ["#FCF434", "#FFFFFF", "#9C59D1", "#2C2C2C"],
        "pan": ["#FF1B8D", "#FFDA00", "#1BB2FF"],
        "rainbow": None
    }
    return flags.get(style_name.lower(), flags["rainbow"])

def get_gradient_color(colors, steps, current_step):
    if len(colors) == 1:
        return hex_to_rgb(colors[0])
    val = (current_step / max(steps - 1, 1)) * (len(colors) - 1)
    idx1 = int(math.floor(val))
    idx2 = min(idx1 + 1, len(colors) - 1)
    factor = val - idx1
    r1, g1, b1 = hex_to_rgb(colors[idx1])
    r2, g2, b2 = hex_to_rgb(colors[idx2])
    return (
        int(r1 + factor * (r2 - r1)),
        int(g1 + factor * (g2 - g1)),
        int(b1 + factor * (b2 - b1))
    )

def render_line_colors(line, total_steps, frame_shift=0.0):
    style = CFG["banner_style"].lower()
    colors = CFG["custom_colors"] if style == "custom" else get_flag_palette(style)
    colored_line = []
    
    for idx, char in enumerate(line):
        if colors is None:
            freq = (CFG["chroma_frequency_scale"] * math.pi) / total_steps
            phase = CFG["theme_accent_phase"] + frame_shift
            r = int(math.sin(freq * idx + phase + 0) * 127 + 128)
            g = int(math.sin(freq * idx + phase + 2.0 * math.pi / 3) * 127 + 128)
            b = int(math.sin(freq * idx + phase + 4.0 * math.pi / 3) * 127 + 128)
        else:
            r, g, b = get_gradient_color(colors, total_steps, idx)
            if frame_shift != 0:
                dim_factor = max(0.1, 1.0 - (abs(frame_shift) * 0.15))
                r, g, b = int(r * dim_factor), int(g * dim_factor), int(b * dim_factor)
                
        colored_line.append(f"\033[38;2;{r};{g};{b}m{char}")
    return "".join(colored_line) + "\033[0m"

def play_intro_animation():
    text_lines = CFG["banner_text"].splitlines()
    anim_type = CFG["intro_animation"].lower()
    speed = CFG["animation_speed"]

    if anim_type == "none":
        for line in text_lines:
            if line.strip():
                print(render_line_colors(line, max(len(line), 20)))
            else:
                print()
        return

    if anim_type == "cascade":
        for i in range(1, len(text_lines) + 1):
            os.system('clear' if os.name == 'posix' else 'cls')
            for line_idx in range(i):
                line = text_lines[line_idx]
                if line.strip():
                    print(render_line_colors(line, max(len(line), 20), frame_shift=(i - line_idx) * 0.2))
                else:
                    print()
            time.sleep(speed * 2)

    elif anim_type == "fade":
        for frame in range(6, -1, -1):
            os.system('clear' if os.name == 'posix' else 'cls')
            for line in text_lines:
                if line.strip():
                    print(render_line_colors(line, max(len(line), 20), frame_shift=frame))
                else:
                    print()
            time.sleep(speed * 1.5)

    os.system('clear' if os.name == 'posix' else 'cls')
    for line in text_lines:
        if line.strip():
            print(render_line_colors(line, max(len(line), 20)))
        else:
            print()

def print_rainbow_token(text, phase):
    total_steps = max(len(text), 1)
    colored = []
    for idx, char in enumerate(text):
        freq = (2.0 * math.pi) / 15
        r = int(math.sin(freq * idx + phase + 0) * 127 + 128)
        g = int(math.sin(freq * idx + phase + 2.0 * math.pi / 3) * 127 + 128)
        b = int(math.sin(freq * idx + phase + 4.0 * math.pi / 3) * 127 + 128)
        colored.append(f"\033[38;2;{r};{g};{b}m{char}")
    sys.stdout.write("".join(colored) + "\033[0m")
    sys.stdout.flush()

def get_system_specs():
    try:
        uptime = subprocess.check_output(["uptime", "-p"], text=True).strip()
        return {"status": "success", "info": f"System uptime: {uptime}"}
    except Exception as e:
        return {"status": "error", "message": str(e)}

def list_directory_files():
    try:
        files = os.listdir(".")[:15]
        return {"status": "success", "files": files}
    except Exception as e:
        return {"status": "error", "message": str(e)}

TOOL_REGISTRY = {
    "get_system_specs": get_system_specs,
    "list_directory_files": list_directory_files
}

TOOL_DEFINITIONS = [
    {
        "type": "function",
        "function": {
            "name": "get_system_specs",
            "description": "Get the current system uptime status from the Linux host machine.",
            "parameters": {"type": "object", "properties": {}}
        }
    },
    {
        "type": "function",
        "function": {
            "name": "list_directory_files",
            "description": "List files inside the current working terminal folder path directory.",
            "parameters": {"type": "object", "properties": {}}
        }
    }
]

class PrismCLI:
    def __init__(self):
        self.host_url = "http://localhost:11434"
        self.installed_models = self.fetch_installed_models()
        self.model_name = self.installed_models[0] if self.installed_models else "llama3"
        
        if self.installed_models and CFG["default_model"] in self.installed_models:
            self.model_name = CFG["default_model"]

        self.history = [
            {"role": "system", "content": f"You are {CFG['assistant_name']}. A clean terminal AI companion."}
        ]
        self.tools_supported = True
        self.current_session_file = None
        self.last_assistant_response = ""

    def query_api_raw(self, endpoint, payload=None):
        url = f"{self.host_url}{endpoint}"
        req = urllib.request.Request(url, method="GET" if payload is None else "POST")
        if payload is not None:
            req.add_header("Content-Type", "application/json")
            return urllib.request.urlopen(req, json.dumps(payload).encode("utf-8"), timeout=30)
        return urllib.request.urlopen(req, timeout=30)

    def fetch_installed_models(self):
        try:
            with self.query_api_raw("/api/tags") as res:
                data = json.loads(res.read().decode("utf-8"))
                return [m['name'] for m in data.get('models', [])]
        except Exception:
            return []

    def copy_to_clipboard(self):
        if not self.last_assistant_response:
            print("\n\033[33m[!] No response text exists in history buffer yet.\033[0m\n")
            return
        try:
            if shutil.which("wl-copy"):
                process = subprocess.Popen(['wl-copy'], stdin=subprocess.PIPE)
                process.communicate(input=self.last_assistant_response.encode('utf-8'))
            elif shutil.which("xclip"):
                process = subprocess.Popen(['xclip', '-selection', 'clipboard'], stdin=subprocess.PIPE)
                process.communicate(input=self.last_assistant_response.encode('utf-8'))
            elif shutil.which("xsel"):
                process = subprocess.Popen(['xsel', '--clipboard', '--input'], stdin=subprocess.PIPE)
                process.communicate(input=self.last_assistant_response.encode('utf-8'))
            else:
                print("\n\033[31m[-] Clipboard utility missing. Install xclip or wl-clipboard.\033[0m\n")
                return
            print("\n\033[1;32m✔ Last AI response synced cleanly to system clipboard!\033[0m\n")
        except Exception as e:
            print(f"\n\033[31m[-] Clipboard write failure: {e}\033[0m\n")

    def start_new_session(self):
        self.save_current_history()
        self.history = [
            {"role": "system", "content": f"You are {CFG['assistant_name']}. A clean terminal AI companion."}
        ]
        self.current_session_file = None
        self.last_assistant_response = ""
        self.draw_ui_frame(animated=False)
        print("\033[1;34m✔ Dropped execution tree. New conversational sequence ready.\033[0m\n")

    def save_current_history(self):
        if len(self.history) <= 1:
            return
        if not self.current_session_file:
            timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
            self.current_session_file = os.path.join(HISTORY_DIR, f"chat_{timestamp}.json")
        try:
            with open(self.current_session_file, "w") as f:
                json.dump({"model": self.model_name, "history": self.history}, f, indent=4)
        except Exception as e:
            print(f"\033[31m[-] Failed to save history block: {e}\033[0m")

    def select_and_load_history(self):
        try:
            files = sorted([f for f in os.listdir(HISTORY_DIR) if f.endswith(".json")], reverse=True)
            if not files:
                print("\n\033[33m[!] No historical logs discovered in storage pipelines.\033[0m\n")
                return
            
            print("\n\033[1;36m--- Saved Memory Context Pipelines ---\033[0m")
            for idx, filename in enumerate(files[:10]):
                filepath = os.path.join(HISTORY_DIR, filename)
                with open(filepath, "r") as f:
                    meta = json.load(f)
                snippet = "Empty stream summary"
                for msg in meta.get("history", []):
                    if msg.get("role") == "user":
                        snippet = msg.get("content", "")[:35] + "..."
                        break
                print(f"  [{idx + 1}] {filename[:-5]} ({meta.get('model', 'unknown')}) -> {snippet}")
            print("  [c] Cancel sequence back to live console\n")

            choice = input("\033[1;30mSelect historical log indices » \033[0m").strip().lower()
            if choice == 'c' or not choice:
                print("\n\033[32m✔ Aborted memory pull. Retaining active pipeline.\033[0m\n")
                return
            
            idx = int(choice) - 1
            if 0 <= idx < len(files):
                self.current_session_file = os.path.join(HISTORY_DIR, files[idx])
                with open(self.current_session_file, "r") as f:
                    data = json.load(f)
                self.model_name = data.get("model", self.model_name)
                self.history = data.get("history", [])
                
                # Restore last assistant response reference from history array
                for msg in reversed(self.history):
                    if msg.get("role") == "assistant" and msg.get("content"):
                        self.last_assistant_response = msg["content"]
                        break
                print(f"\n\033[1;32m✔ Memory block mapped. Restored {len(self.history)-1} dialogue states.\033[0m\n")
        except Exception as e:
            print(f"\n\033[31m[-] Log context mapping failed: {e}\033[0m\n")

    def draw_ui_frame(self, animated=True):
        if animated:
            play_intro_animation()
        else:
            os.system('clear' if os.name == 'posix' else 'cls')
            for line in CFG["banner_text"].splitlines():
                if line.strip():
                    print(render_line_colors(line, max(len(line), 20)))
                else:
                    print()
                    
        print("\033[90m─" * shutil.get_terminal_size().columns + "\033[0m")
        print(f"\033[1;32m● Engine:\033[0m \033[1;37m{self.model_name}\033[0m  |  Palette: \033[1;35m{CFG['banner_style']}\033[0m")
        print("\033[90mType \033[33m/help\033[90m or use terminal string triggers (/new, /copy)\033[0m\n")

    def switch_model(self, target_name):
        if target_name not in self.installed_models:
            print(f"\n\033[31m[-] Target engine '{target_name}' not available on disk.\033[0m\n")
            return
        self.model_name = target_name
        self.tools_supported = True
        print(f"\n\033[1;32m✔ Runtime context point mapped to: '{self.model_name}'\033[0m\n")

    def execute_live_stream(self, user_input: str):
        if user_input:
            self.history.append({"role": "user", "content": user_input})

        payload = {
            "model": self.model_name,
            "messages": self.history,
            "stream": True
        }
        if self.tools_supported:
            payload["tools"] = TOOL_DEFINITIONS

        try:
            with self.query_api_raw("/api/chat", payload) as response:
                print(f"\n\033[1m{CFG['assistant_name']} >\033[0m")
                
                full_reply = ""
                tool_calls_pending = []
                phase_tracker = 0.0
                
                for line in response:
                    if not line:
                        continue
                    chunk = json.loads(line.decode("utf-8"))
                    msg_chunk = chunk.get("message", {})
                    
                    if msg_chunk.get("tool_calls"):
                        tool_calls_pending.extend(msg_chunk["tool_calls"])
                        continue
                        
                    content_token = msg_chunk.get("content", "")
                    if content_token:
                        full_reply += content_token
                        print_rainbow_token(content_token, phase_tracker)
                        phase_tracker += 0.08

                print("\n")

                if tool_calls_pending:
                    for tool in tool_calls_pending:
                        func_name = tool["function"]["name"]
                        if func_name in TOOL_REGISTRY:
                            print(f"\033[90m⚡ [System Executing]: {func_name}()...\033[0m")
                            result = TOOL_REGISTRY[func_name]()
                            
                            self.history.append({"role": "assistant", "content": None, "tool_calls": tool_calls_pending})
                            self.history.append({
                                "role": "tool",
                                "name": func_name,
                                "content": json.dumps(result)
                            })
                            return self.execute_live_stream("")

                if full_reply:
                    self.history.append({"role": "assistant", "content": full_reply})
                    self.last_assistant_response = full_reply
                
                self.save_current_history()

        except urllib.error.HTTPError as e:
            if e.code == 400 and self.tools_supported:
                self.tools_supported = False
                sys.stdout.write("\033[F\033[K")
                print(f"\033[33m[!] '{self.model_name}' lacks tools. Dropping to text-stream mode.\033[0m")
                return self.execute_live_stream("")
            else:
                print(f"\n\033[31m[-] HTTP Transport Failure: {e.reason}\033[0m\n")
        except Exception as e:
            print(f"\n\033[31m[-] Stream Crash: {e}\033[0m\n")

    def start(self):
        self.draw_ui_frame(animated=True)
        while True:
            try:
                display_name = self.model_name.split(":")[0]
                symbol = CFG["user_prompt_symbol"]
                user_input = input(f"\033[1;30m{symbol} {display_name} \033[0m» ").strip()
                if not user_input:
                    continue
                
                if user_input.lower() in ["exit", "quit"]:
                    break
                if user_input.lower() == "/help":
                    print("\n\033[1;36m--- Internal Workspace Command Layer ---\033[0m")
                    print("  /models        List local disk engine options")
                    print("  /model <name>  Hot-swap pipeline target to another layout")
                    print("  /history       Review log registry map and load past sessions")
                    print("  /new  [Ctrl+N] Drop active thread context and open a fresh canvas")
                    print("  /copy [Ctrl+Y] Copy last complete AI response block to clipboard")
                    print("  /clear         Wipe window and re-trigger animation sequence")
                    print("  exit           Safely shut down app stack context\n")
                    continue
                if user_input.lower() == "/clear":
                    self.draw_ui_frame(animated=False)
                    continue
                if user_input.lower() == "/new":
                    self.start_new_session()
                    continue
                if user_input.lower() == "/copy":
                    self.copy_to_clipboard()
                    continue
                if user_input.lower() == "/history":
                    self.select_and_load_history()
                    continue
                if user_input.lower() == "/models":
                    print("\n\033[1;34m--- Discovered Storage Blocks ---\033[0m")
                    for m in self.installed_models:
                        marker = "★ (Active)" if m == self.model_name else ""
                        print(f"  • {m} \033[32m{marker}\033[0m")
                    print()
                    continue
                if user_input.startswith("/model "):
                    self.switch_model(user_input.split(" ", 1)[1].strip())
                    continue

                self.execute_live_stream(user_input)
            except (KeyboardInterrupt, EOFError):
                break
        print(f"\n\033[3mTerminating context instance. Goodbye.\033[0m")

if __name__ == "__main__":
    if "COLORTERM" not in os.environ:
        os.environ["COLORTERM"] = "truecolor"
    
    try:
        import readline
        readline.parse_and_bind('"\C-n": "/new\n"')
        readline.parse_and_bind('"\C-y": "/copy\n"')
    except ImportError:
        pass

    client = PrismCLI()
    client.start()
