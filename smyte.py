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

CONFIG_PATH = os.path.expanduser("~/.config/smyte/usage.json")
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

def load_or_reset_usage():
    now = datetime.now().strftime('%Y-%m-%d')
    if not os.path.exists(CONFIG_PATH):
        os.makedirs(os.path.dirname(CONFIG_PATH), exist_ok=True)
        sent, recv = get_data_usage()
        with open(CONFIG_PATH, 'w') as f:
            json.dump({'date': now, 'start_sent': sent, 'start_recv': recv}, f)
        return sent, recv

    with open(CONFIG_PATH, 'r') as f:
        data = json.load(f)

    if data.get("date") != now:
        sent, recv = get_data_usage()
        data = {'date': now, 'start_sent': sent, 'start_recv': recv}
        with open(CONFIG_PATH, 'w') as f:
            json.dump(data, f)
        return sent, recv

    return data['start_sent'], data['start_recv']

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
    start_sent, start_recv = load_or_reset_usage()
    try:
        with Live(console=console, refresh_per_second=1):
            while True:
                sent, recv = get_data_usage()
                upload = max(0, sent - start_sent)
                download = max(0, recv - start_recv)
                panel = build_ui(upload, download)
                console.clear()
                console.print(panel)
                time.sleep(1)
    except KeyboardInterrupt:
        console.print("\n[red bold]❌ Exiting Smyte...[/]")

if __name__ == "__main__":
    main()
