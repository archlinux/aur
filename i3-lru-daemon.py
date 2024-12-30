#!/usr/bin/env python3
import os
import sys
from pathlib import Path

import i3ipc

# Where we store the LRU order
CACHE_FILE = Path.home() / ".cache" / "i3-lru-order"

# Global list that tracks windows in MRU order (front = most recently used)
lru_list = []


def save_lru_list():
    """Save the current LRU list to a file so the 'i3-lru' script can read it."""
    with open(CACHE_FILE, "w", encoding="utf-8") as f:
        for wid in lru_list:
            f.write(f"{wid}\n")


def load_lru_list():
    """Load LRU list from file (if it exists) when daemon starts."""
    global lru_list
    if CACHE_FILE.is_file():
        with open(CACHE_FILE, "r", encoding="utf-8") as f:
            lru_list = [line.strip() for line in f if line.strip()]


def update_lru(window_id):
    """Move window_id to front of the lru_list."""
    # Remove if already present
    try:
        lru_list.remove(window_id)
    except ValueError:
        pass
    # Insert at front
    lru_list.insert(0, window_id)
    save_lru_list()


def on_window_focus(i3, event):
    # event.container is the newly-focused container
    focused_id = str(event.container.id)
    update_lru(focused_id)


def main():
    # Start up i3 connection
    i3 = i3ipc.Connection()

    # Load any existing list from file
    load_lru_list()

    # Subscribe to focus events
    i3.on("window::focus", on_window_focus)

    # Main loop
    i3.main()


if __name__ == "__main__":
    main()
