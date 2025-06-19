#!/usr/bin/env python3
import os
import time
import json
import psutil
from datetime import date
from rich.console import Console
from rich.panel import Panel
from rich.text import Text
from rich.align import Align
from rich.style import Style
from rich.live import Live

console = Console()

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

TRACK_FILE = os.path.expanduser("~/.smyte_usage.json")

def format_bytes(size):
    for unit in ['B','KB','MB','GB','TB']:
        if size < 1024:
            return f"{size:.2f} {unit}"
        size /= 1024
    return f"{size:.2f} PB"

def get_data_usage():
    counters = psutil.net_io_counters()
    return counters.bytes_sent, counters.bytes_recv

def load_usage_data():
    if os.path.exists(TRACK_FILE):
        with open(TRACK_FILE, "r") as f:
            try:
                data = json.load(f)
                if data.get("date") != str(date.today()):
                    raise Exception("New day")
                return data
            except:
                pass

    sent, recv = get_data_usage()
    data = {
        "date": str(date.today()),
        "start_sent": sent,
        "start_recv": recv
    }
    with open(TRACK_FILE, "w") as f:
        json.dump(data, f)
    return data

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
    try:
        usage_data = load_usage_data()
        start_sent = usage_data["start_sent"]
        start_recv = usage_data["start_recv"]

        with Live(console=console, refresh_per_second=1):
            while True:
                curr_sent, curr_recv = get_data_usage()
                upload = max(0, curr_sent - start_sent)
                download = max(0, curr_recv - start_recv)
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
