#!/usr/bin/env python3
import os
import sys
import time
import psutil
from rich.console import Console
from rich.panel import Panel
from rich.text import Text
from rich.align import Align
from rich.style import Style
from rich.live import Live

console = Console()

def format_bytes(size):
    for unit in ['B','KB','MB','GB','TB']:
        if size < 1024:
            return f"{size:.2f} {unit}"
        size /= 1024
    return f"{size:.2f} PB"

def get_banner_path():
    # AUR install path
    system_path = "/usr/share/smyte/banner.txt"
    # Fallback for local testing (like in the cloned folder)
    local_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), "banner.txt")
    
    if os.path.exists(system_path):
        return system_path
    elif os.path.exists(local_path):
        return local_path
    else:
        return None

def load_ascii_banner():
    banner_path = get_banner_path()
    if banner_path:
        try:
            with open(banner_path, "r") as f:
                return f.read()
        except:
            return "NETLOG"
    else:
        return "NETLOG"

def get_data_usage():
    counters = psutil.net_io_counters()
    return counters.bytes_sent, counters.bytes_recv

def build_ui(upload, download):
    banner = load_ascii_banner()
    usage_text = Text()
    usage_text.append(f"📤 Uploaded:   {format_bytes(upload)}\n", style=Style(color="cyan", bold=True))
    usage_text.append(f"📥 Downloaded: {format_bytes(download)}\n", style=Style(color="green", bold=True))

    full_panel = Panel(
        Align.center(
            Text(banner, style="bold magenta") + Text("\n\n") + usage_text,
            vertical="middle"
        ),
        border_style="bold magenta",
        title="📶 Smyte - Data Usage Tracker",
        padding=(2, 10)
    )

    return full_panel

def main():
    try:
        with Live(console=console, refresh_per_second=1):
            while True:
                upload, download = get_data_usage()
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
        print("Setting up virtual environment and installing dependencies...")
        os.system("python -m venv venv && source venv/bin/activate && pip install rich psutil && python smyte.py")
#!/usr/bin/env python3
import os
import sys
import time
import psutil
from rich.console import Console
from rich.panel import Panel
from rich.text import Text
from rich.align import Align
from rich.style import Style
from rich.live import Live

console = Console()

def format_bytes(size):
    for unit in ['B','KB','MB','GB','TB']:
        if size < 1024:
            return f"{size:.2f} {unit}"
        size /= 1024
    return f"{size:.2f} PB"

def get_banner_path():
    # AUR install path
    system_path = "/usr/share/smyte/banner.txt"
    # Fallback for local testing (like in the cloned folder)
    local_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), "banner.txt")
    
    if os.path.exists(system_path):
        return system_path
    elif os.path.exists(local_path):
        return local_path
    else:
        return None

def load_ascii_banner():
    banner_path = get_banner_path()
    if banner_path:
        try:
            with open(banner_path, "r") as f:
                return f.read()
        except:
            return "NETLOG"
    else:
        return "NETLOG"

def get_data_usage():
    counters = psutil.net_io_counters()
    return counters.bytes_sent, counters.bytes_recv

def build_ui(upload, download):
    banner = load_ascii_banner()
    usage_text = Text()
    usage_text.append(f"📤 Uploaded:   {format_bytes(upload)}\n", style=Style(color="cyan", bold=True))
    usage_text.append(f"📥 Downloaded: {format_bytes(download)}\n", style=Style(color="green", bold=True))

    full_panel = Panel(
        Align.center(
            Text(banner, style="bold magenta") + Text("\n\n") + usage_text,
            vertical="middle"
        ),
        border_style="bold magenta",
        title="📶 Smyte - Data Usage Tracker",
        padding=(2, 10)
    )

    return full_panel

def main():
    try:
        with Live(console=console, refresh_per_second=1):
            while True:
                upload, download = get_data_usage()
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
        print("Setting up virtual environment and installing dependencies...")
        os.system("python -m venv venv && source venv/bin/activate && pip install rich psutil && python smyte.py")
