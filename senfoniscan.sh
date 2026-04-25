#!/bin/bash

# User-specific directory to store the isolated environment, config, and reports
USER_DIR="$HOME/.local/share/senfoniscan"

# Check if it is the first run for the user
if [ ! -d "$USER_DIR" ]; then
    echo -e "\e[96m[*] SenfoniScan: Initializing user environment in $USER_DIR...\e[0m"
    mkdir -p "$USER_DIR"
    cp -r /usr/share/senfoniscan/* "$USER_DIR/"
fi

# Switch to user directory and execute
cd "$USER_DIR"
exec python main.py "$@"
