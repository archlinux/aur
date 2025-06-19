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

# Config file path
CONFIG_DIR = os.path.expanduser("~/.config/smyte")
os.makedirs(CONFIG_DIR, exist_ok=True)
DATA_FILE = os.path.join(CONFIG_DIR, "usage.json")

# Banner
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
        if abs(size) < 1024:
            return f"{size:.2f} {unit}"
        size /= 1024
    return f"{size:.2f} PB"

def get_data_usage():
    counters = psutil.net_io_counters()
    return counters.bytes_sent, counters.bytes_recv

def load_usage_data():
    today = datetime.now().strftime('%Y-%m-%d')
    if os.path.exists(DATA_FILE):
        try:
            with open(DATA_FILE, 'r') as f:
                data = json.load(f)
                if (
                    isinstance(data, dict)
                    and data.get('date') == today
                    and 'sent' in data
                    and 'recv' in data
                ):
                    return data['sent'], data['recv']
        except (json.JSONDecodeError, KeyError):
            pass  # fallback to reset

    # Reset: Create fresh usage data
    sent, recv = get_data_usage()
    with open(DATA_FILE, 'w') as f:
        json.dump({'date': today, 'sent': sent, 'recv': recv}, f)
    return sent, recv

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
    start_sent, start_recv = load_usage_data()
    try:
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
    main()
