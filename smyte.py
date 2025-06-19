#!/usr/bin/env python3
import time
import psutil
import os
import json
from datetime import datetime
from rich.console import Console
from rich.panel import Panel
from rich.text import Text
from rich.align import Align
from rich.style import Style
from rich.live import Live

console = Console()
DATA_FILE = os.path.expanduser("~/.smyte_data.json")

BANNER = r"""
   ▄████████   ▄▄▄▄███▄▄▄▄   ▄██   ▄       ███        ▄████████ 
  ███    ███ ▄██▀▀▀███▀▀▀██▄ ███   ██▄ ▀█████████▄   ███    ███ 
  ███    █▀  ███   ███   ███ ███▄▄▄███    ▀███▀▀██   ███    █▀  
  ███        ███   ███   ███ ▀▀▀▀▀▀███     ███   ▀  ▄███▄▄▄     
▀███████████ ███   ███   ███ ▄██   ███     ███     ▀▀███▀▀▀     
         ███ ███   ███   ███ ███   ███     ███       ███    █▄  
   ▄█    ███ ███   ███   ███ ███   ███     ███       ███    ███ 
 ▄████████▀   ▀█   ███   █▀   ▀█████▀     ▄████▀     ██████████ 
"""

def format_bytes(size):
    for unit in ['B','KB','MB','GB','TB']:
        if size < 1024:
            return f"{size:.2f} {unit}"
        size /= 1024
    return f"{size:.2f} PB"

def get_data_usage():
    counters = psutil.net_io_counters()
    return counters.bytes_sent, counters.bytes_recv

def load_or_reset_data():
    today = datetime.now().strftime("%Y-%m-%d")
    if os.path.exists(DATA_FILE):
        with open(DATA_FILE, "r") as f:
            data = json.load(f)
        if data.get("date") != today:
            # New day → reset
            data = {"date": today, "sent": get_data_usage()[0], "recv": get_data_usage()[1]}
            with open(DATA_FILE, "w") as f:
                json.dump(data, f)
    else:
        # First run
        data = {"date": today, "sent": get_data_usage()[0], "recv": get_data_usage()[1]}
        with open(DATA_FILE, "w") as f:
            json.dump(data, f)
    return data["sent"], data["recv"]

def build_ui(upload, download):
    usage_text = Text()
    usage_text.append(f"📤 Uploaded:   {format_bytes(upload)}\n", style=Style(color="cyan", bold=True))
    usage_text.append(f"📥 Downloaded: {format_bytes(download)}\n", style=Style(color="green", bold=True))

    full_panel = Panel(
        Align.center(
            Text(BANNER, style="bold magenta") + Text("\n\n") + usage_text,
            vertical="middle"
        ),
        border_style="bold magenta",
        title="📶 Smyte - Data Usage Tracker",
        padding=(2, 10)
    )
    return full_panel

def main():
    base_sent, base_recv = load_or_reset_data()
    try:
        with Live(console=console, refresh_per_second=1):
            while True:
                curr_sent, curr_recv = get_data_usage()
                panel = build_ui(curr_sent - base_sent, curr_recv - base_recv)
                console.clear()
                console.print(panel)
                time.sleep(1)
    except KeyboardInterrupt:
        console.print("\n[red bold]❌ Exiting Smyte...[/]")

if __name__ == "__main__":
    try:
        import rich, psutil
        main()
    except ImportError:
        print("Installing dependencies...")
        os.system("python -m venv venv && source venv/bin/activate && pip install rich psutil && python smyte.py")
