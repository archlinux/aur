import os
import json
import subprocess
import time
from datetime import datetime
from pathlib import Path
import configparser
logfile = "/tmp/hypr-hide-debug.log"
config = configparser.ConfigParser()
user_config_path = os.path.expanduser("~/.config/hyprhide/config.cfg")
default_config_path = "/usr/share/hyprhide/config.cfg"

if os.path.exists(user_config_path):
    config.read(user_config_path)
elif os.path.exists(default_config_path):
    config.read(default_config_path)
elif os.path.exists("config.cfg"):
    config.read("config.cfg")
else:
    print("Please create a config.cfg file, or install this properly ")
USE_THUMBNAILS = config.get('GUI', 'thumbnails', fallback=False)
def log(message):
    with open(logfile, "a") as f:
        f.write(message + "\n")
    print(message)

def run(cmd, capture=True):
    try:
        result = subprocess.run(cmd, shell=True, check=True,
                                stdout=subprocess.PIPE if capture else None,
                                stderr=subprocess.DEVNULL if capture else None)
        return result.stdout.decode().strip() if capture else None
    except subprocess.CalledProcessError:
        return None

# Start log
log(f"\n--- {datetime.now()} ---")

# Ensure directory exists
Path("~/.local/share/hypr-hide").expanduser().mkdir(parents=True, exist_ok=True)

# Check dependencies
for cmd in ["jq", "hyprctl", "grim"]:
    if not run(f"command -v {cmd}"):
        log(f"ERROR: '{cmd}' is required but not installed.")
        exit(1)

# Get active window JSON
client_raw = run("hyprctl activewindow -j")
log(f"Raw activewindow JSON: {client_raw}")

if not client_raw or client_raw == "null":
    log("No active window found.")
    exit(1)

client = json.loads(client_raw)
address = client.get("address")
if not address or address == "null":
    log("Active window has no valid address.")
    exit(1)

log(f"Window address: {address}")

# Get full client info from clients list
clients_json_raw = run("hyprctl clients -j")
clients = json.loads(clients_json_raw)

client_info = next((c for c in clients if c["address"] == address), None)
if not client_info:
    log(f"Could not find window info for address {address}")
    exit(1)

title = client_info.get("title")
x, y = client_info.get("at", [0, 0])
width, height = client_info.get("size", [0, 0])
fullscreen = client_info.get("fullscreen")
floating = client_info.get("floating")

log(f"Window info - Title: {title}, x={x} y={y} w={width} h={height} fullscreen={fullscreen} floating={floating}")

# If fullscreen, toggle off
if fullscreen == 1:
    log("Window is fullscreen, toggling fullscreen OFF...")
    run(f"hyprctl dispatch fullscreen {address} 0", capture=False)
    time.sleep(0.3)

# If not floating, toggle floating ON
if floating is not True:
    log("Window is not floating, toggling floating ON...")
    run("hyprctl dispatch togglefloating", capture=False)
    time.sleep(0.3)
    # Recheck floating state
    clients = json.loads(run("hyprctl clients -j"))
    floating_after = next((c.get("floating") for c in clients if c["address"] == address), None)
    log(f"Floating after toggle: {floating_after}")
    if floating_after != True:
        log("Floating toggle did not apply, trying again...")
        run(f"hyprctl dispatch togglefloating {address}", capture=False)
        time.sleep(0.3)

# Focus the window
log(f"Focusing window {address}...")
run(f"hyprctl dispatch focuswindow address={address}", capture=False)
time.sleep(0.3)

# Save window info
info_path = Path(f"~/.local/share/hypr-hide/{address}.json").expanduser()
with open(info_path, "w") as f:
    json.dump(client_info, f, indent=2)

# Prepare screenshot path
screenshot_path = Path(f"~/.local/share/hypr-hide/{address}.png").expanduser()

# Re-fetch geometry
clients = json.loads(run("hyprctl clients -j"))
target = next((c for c in clients if c["address"] == address), None)
if not target:
    log(f"Window {address} not found.")
    exit(1)

x, y = target.get("at", [None, None])
w, h = target.get("size", [None, None])
if None in [x, y, w, h]:
    log("Missing geometry info.")
    exit(1)

# Focus again before screenshot
log(f"Focusing window {address}...")
run(f"hyprctl dispatch focuswindow address:{address}", capture=False)
time.sleep(0.1)

# Take screenshot
if(USE_THUMBNAILS =='True'):
    log(f"Taking screenshot at geometry: {x},{y} {w}x{h}")
    run(f"grim -g '{x},{y} {w}x{h}' '{screenshot_path}'", capture=False)
    log(f"Screenshot saved to {screenshot_path}")

# Move window offscreen
run("hyprctl dispatch moveactive 5000 5000", capture=False)
log("Moved window offscreen.")

# Confirm position and state
clients = json.loads(run("hyprctl clients -j"))
after_move = next(({
    "at": c.get("at"),
    "fullscreen": c.get("fullscreen"),
    "floating": c.get("floating")
} for c in clients if c["address"] == address), None)

log(f"After move state: {after_move}")
