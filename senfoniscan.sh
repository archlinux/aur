#!/bin/bash

# User-specific directory to store the isolated environment, config, and reports
USER_DIR="$HOME/.local/share/senfoniscan"

# Check if it is the first run for the user
# Sync/Update code files but preserve .venv and config.json
mkdir -p "$USER_DIR"
cp /usr/share/senfoniscan/*.py "$USER_DIR/" 2>/dev/null
cp -r /usr/share/senfoniscan/core "$USER_DIR/" 2>/dev/null
if [ ! -f "$USER_DIR/config.json" ]; then
    cp /usr/share/senfoniscan/config.json "$USER_DIR/" 2>/dev/null
fi

# Switch to user directory and execute
cd "$USER_DIR"
exec python main.py "$@"
