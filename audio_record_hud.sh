#!/usr/bin/env bash

# Copyright (c) 2026 Darkstar. All rights reserved. Licensed under the MIT License.

# Ensure the output directory exists
mkdir -p "$HOME/audio/hypr_rec/"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
OUTPUT_FILE="$HOME/audio/hypr_rec/recording_${TIMESTAMP}.flac"

# Start the recording cleanly in the background
pw-record "$OUTPUT_FILE" &
RECORD_PID=$!

# Send a native desktop notification
notify-send 'Recording Started' 'Capturing system/mic audio...' -i audio-input-microphone

# Array of cyberpunk visualizer rows to loop through
frames=(
    "  ▂ ▃ ▄ ▅ ▆ ▇ █ ▇ ▆ ▅ ▄ ▃ ▂  "
    "  ▄ ▅ ▆ ▇ █ ▇ ▆ ▅ ▄ ▃ ▂     "
    "  ▆ ▇ █ ▇ ▆ ▅ ▄ ▃ ▂         "
    "  █ ▇ ▆ ▅ ▄ ▃ ▂         ▂ ▃ "
    "  ▇ ▆ ▅ ▄ ▃ ▂         ▂ ▃ ▄ "
    "  ▆ ▅ ▄ ▃ ▂         ▂ ▃ ▄ ▅ "
    "  ▅ ▄ ▃ ▂         ▂ ▃ ▄ ▅ ▆ "
    "  ▄ ▃ ▂         ▂ ▃ ▄ ▅ ▆ ▇ "
    "  ▃ ▂         ▂ ▃ ▄ ▅ ▆ ▇ █ "
)

# Trap signals (like closing the terminal or hitting the shortcut again)
cleanup() {
    kill -INT "$RECORD_PID" 2>/dev/null
    notify-send 'Recording Saved' "Saved to Hypr_REC @ /audio/hypr_rec/" -i audio-card
    exit 0
}
trap cleanup SIGINT SIGTERM

# Clear screen and hide cursor for a clean HUD look
clear
tput civvis

# Main display loop
while kill -0 "$RECORD_PID" 2>/dev/null; do
    for frame in "${frames[@]}"; do
        # Clear screen and draw a stylized layout
        clear
        echo -e "\e[1;35m      ✨ AUDIO CAPTURE HUD ✨\e[0m"
        echo -e "\e[1;36m  ───────────────────────────────\e[0m"
        echo ""
        echo -e "   \e[1;31m🔴 RECORDING LIVE...\e[0m"
        echo ""
        echo -e "   \e[1;33m$frame\e[0m"
        echo ""
        echo -e "\e[1;30m  Press SUPER+CTRL+R or Ctrl+C to Stop\e[0m"
        
        sleep 0.1
    done
done

# Restore cursor if loop breaks
tput cnorm
