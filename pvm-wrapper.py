#!/usr/bin/env python3
import os, sys
from pathlib import Path
from urllib.request import urlopen

LOADER_URL = "https://raw.githubusercontent.com/f1nnsauce/pvm/refs/heads/main/loader.py"
LOADER_VERSION_URL = "https://raw.githubusercontent.com/f1nnsauce/pvm/refs/heads/main/pvm-version-loader.txt"

LOCAL_DIR = Path.home() / ".local/share/pvm"
LOCAL_DIR.mkdir(parents=True, exist_ok=True)
LOADER = LOCAL_DIR / "loader.py"
LOADER_VERSION = LOCAL_DIR / "pvm-version-loader.txt"

def fetch(url: str) -> str:
    with urlopen(url) as r:
        return r.read().decode("utf-8")

if len(sys.argv) == 2 and sys.argv[1] == "update":
    LOADER.write_text(fetch(LOADER_URL))
    LOADER_VERSION.write_text(fetch(LOADER_VERSION_URL))
    print("PVM Loader updated.")
if not LOADER.exists():
    LOADER.write_text(fetch(LOADER_URL))
if not LOADER_VERSION.exists():
    LOADER_VERSION.write_text(fetch(LOADER_VERSION_URL))

# Run the actual loader
os.execv(
    sys.executable,
    [sys.executable, str(LOADER), *sys.argv[1:]]
)
