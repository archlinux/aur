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

CONFIG_DIR = os.path.expanduser("~/.config/smyte")
DATA_FILE = os.path.join(CONFIG_DIR, "usage.json")

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

def load_start_data():
    if not os.path.exists(DATA_FILE):
        return save_today_baseline()
    
    with open(DATA_FILE, "r") as f:
        data = json.load(f)
    
    if data.get("date") != datetime.now().strftime("%Y-%m-%d"):
        return save_today_baseline()
    
    return data["start_sent"], data["start_recv"]

def save_today_baseline():
    sent = psutil.net_io_counters().bytes_sent
    recv = psutil.net_io_counters().bytes_recv
    os.makedirs(CONFIG_DIR, exist_ok=True)
    with open(DATA_FILE, "w") as f:
        json.dump({
            "date": datetime.now().strftime("%Y-%m-%d"),
            "start_sent": sent,
            "start_recv": recv
        }, f)
    return sent, recv

def get_data_usage(start_sent, start_recv):
    current = psutil.net_io_counters()
    upload = max(0, current.bytes_sent - start_sent)
    download = max(0, current.bytes_recv - start_recv)
    return upload, download

def build_ui(upload, download):
    usage_text = Text()
    usage_text.append(f"📤 Uploaded:   {format_bytes(upload)}\n", style=Style(color="cyan", bold=True))
    usage_text.append(f"📥 Downloaded: {format_bytes(download)}\n", style=Style(color="green", bold=True))

    full_panel = Panel(
        Align.center(Text(BANNER, style="bold magenta") + Text("\n\n") + usage_text, vertical="middle"),
        border_style="bold magenta",
        title="📶 Smyte - Data Usage Tracker",
        padding=(2, 10)
    )

    return full_panel

def main():
    start_sent, start_recv = load_start_data()
    try:
        with Live(console=console, refresh_per_second=1):
            while True:
                upload, download = get_data_usage(start_sent, start_recv)
                panel = build_ui(upload, download)
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
