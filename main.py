#!/usr/bin/env python3
# Voltix source code
import os
import shutil
from datetime import timedelta
import typer
from rich.console import Console
from rich.text import Text

app = typer.Typer(help="🔋 Display ASCII battery and system power info")

console = Console()

# --- Utility functions -------------------------------------------------------

def format_time(secs: int | None, status: str | None = None) -> str:
    if secs is None or secs < 0:
        if status and status.lower().startswith("charg"):
            return "Charging..."
        return "Unknown"
    return str(timedelta(seconds=secs)).split(".")[0]

def get_sys_battery():
    """Read battery info from /sys/class/power_supply"""
    base = "/sys/class/power_supply"
    if not os.path.isdir(base):
        return None

    for name in os.listdir(base):
        path = os.path.join(base, name)
        if name.lower().startswith("bat") or os.path.exists(os.path.join(path, "capacity")):
            try:
                def readf(fname):
                    p = os.path.join(path, fname)
                    if os.path.exists(p):
                        with open(p) as f:
                            return f.read().strip()
                    return None

                cap = readf("capacity")
                status = readf("status") or "Unknown"
                info = {"percent": int(cap), "status": status}
                return info
            except Exception:
                continue
    return None

def get_psutil_battery():
    try:
        import psutil
    except ImportError:
        return None

    b = psutil.sensors_battery()
    if not b:
        return None

    return {
        "percent": int(round(b.percent)),
        "status": "Charging" if b.power_plugged else "Discharging",
        "secs_left": None if b.secsleft in (-1, None) else int(b.secsleft),
    }

# --- Rendering ---------------------------------------------------------------

def color_for_percent(percent: int) -> str:
    if percent < 20:
        return "red"
    elif percent < 60:
        return "yellow"
    else:
        return "green"

def center_text_block(block: str) -> str:
    """
    Center the whole text block horizontally in the terminal as a single unit.
    This prevents per-line centering which can break alignment between columns.
    """
    try:
        term_width = os.get_terminal_size().columns
    except OSError:
        term_width = 80

    lines = block.splitlines()
    # Find the maximum line length in the block
    max_len = max((len(line) for line in lines), default=0)
    # Compute left padding so the whole block is centered
    left_pad = max((term_width - max_len) // 2, 0)
    # Prefix each line with the same left padding (preserve internal alignment)
    return "\n".join((" " * left_pad) + line for line in lines)

def render_battery(percent: int, status: str, secs_left: int | None):
    width = 28
    height = 9
    fill_cols = int((percent * width) / 100)
    full_block = "█"

    cap = " " * ((width - (width - width // 3)) // 2) + "_" * (width - width // 3)
    lines = [cap.center(width + 2), "╭" + "─" * width + "╮"]

    for _ in range(height):
        fill = full_block * fill_cols + " " * (width - fill_cols)
        lines.append(f"│{fill}│")

    lines.append("╰" + "─" * width + "╯")

    # Insert percent in the center
    perc_text = f"{percent}%"
    mid = 2 + height // 2
    row = list(lines[mid])
    start = 1 + (width - len(perc_text)) // 2
    for i, ch in enumerate(perc_text):
        row[start + i] = ch
    lines[mid] = "".join(row)

    # Info lines
    info = [
        f"Status : {status}",
        f"Charge : {percent}%",
        f"Time   : {format_time(secs_left, status)}",
    ]
    pad = "   "
    combined = [l + pad + info[i] if i < len(info) else l for i, l in enumerate(lines)]

    color = color_for_percent(percent)
    block = "\n".join(combined)
    console.print(Text(center_text_block(block), style=color))

# --- CLI command -------------------------------------------------------------

@app.command()
def show(
    level: int = typer.Option(None, "--level", "-l", help="Simulated battery level (0-100)"),
    status: str = typer.Option(None, "--status", "-s", help="Simulated battery status (Charging/Discharging)"),
    secsleft: int = typer.Option(None, "--secs", "-t", help="Simulated remaining time (in seconds)"),
):
    """Show battery status (real or simulated)"""
    info = get_psutil_battery() or get_sys_battery() or {}

    # Override with simulated data if provided
    if level is not None:
        info["percent"] = level
    if status is not None:
        info["status"] = status
    if secsleft is not None:
        info["secs_left"] = secsleft

    percent = info.get("percent", 50)
    status = info.get("status", "Unknown")
    secs = info.get("secs_left", None)

    render_battery(percent, status, secs)


if __name__ == "__main__":
    app()
