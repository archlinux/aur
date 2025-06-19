#!/usr/bin/env python3
import os
import time
import json
import psutil
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

def load_data():
    if os.path.exists(DATA_FILE):
        with open(DATA_FILE, "r") as f:
            return json.load(f)
    return {"date": "", "sent": 0, "recv": 0}

def save_data(date, sent, recv):
    with open(DATA_FILE, "w") as f:
        json.dump({"date": date, "sent": sent, "recv": recv}, f)

def build_ui(upload, download):
    usage_text = Text()
    usage_text.append(f"📤 Uploaded:   {format_bytes(max(upload, 0))}\n", style=Style(color="cyan", bold=True))
    usage_text.append(f"📥 Downloaded: {format_bytes(max(download, 0))}\n", style=Style(color="green", bold=True))

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
    today = datetime.now().strftime("%Y-%m-%d")
    data = load_data()

    # Reset daily
    if data["date"] != today:
        sent0, recv0 = psutil.net_io_counters().bytes_sent, psutil.net_io_counters().bytes_recv
        save_data(today, sent0, recv0)
    else:
        sent0, recv0 = data["sent"], data["recv"]

    try:
        with Live(console=console, refresh_per_second=1):
            while True:
                sent, recv = psutil.net_io_counters().bytes_sent, psutil.net_io_counters().bytes_recv
                upload = sent - sent0
                download = recv - recv0
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
        os.system("pip install rich psutil")
        main()
