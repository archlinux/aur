#!/bin/bash

# Determine the path for the codai environment file following the XDG Base Directory standard
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/codai"
CONFIG_FILE="$CONFIG_DIR/codai.env"
SAMPLE_FILE="/usr/share/codai/codai.env.sample"

# Check if the configuration file exists; if not, copy the sample
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Configuration file not found. Creating from sample..."
    mkdir -p "$CONFIG_DIR"
    cp "$SAMPLE_FILE" "$CONFIG_FILE"
    cp "$SAMPLE_FILE" "$CONFIG_DIR"
    echo "Sample configuration file copied to -- $CONFIG_FILE -- Please edit it with your API keys."
    exit 1
fi

# Source the environment file
source "$CONFIG_FILE"

# Run the codai application
exec /usr/bin/codai-bin "$@"
