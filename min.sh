#!/bin/bash

logfile="/tmp/hypr-hide-debug.log"
echo "--- $(date) ---" >> "$logfile"

mkdir -p ~/.local/share/hypr-hide

# Check dependencies
for cmd in jq hyprctl grim; do
    if ! command -v "$cmd" &> /dev/null; then
        echo "ERROR: '$cmd' is required but not installed." | tee -a "$logfile"
        exit 1
    fi
done

# Get active window JSON info
client=$(hyprctl activewindow -j 2>/dev/null)
echo "Raw activewindow JSON: $client" >> "$logfile"

if [[ -z "$client" || "$client" == "null" ]]; then
    echo "No active window found." | tee -a "$logfile"
    exit 1
fi

address=$(echo "$client" | jq -r '.address')
if [[ -z "$address" || "$address" == "null" ]]; then
    echo "Active window has no valid address." | tee -a "$logfile"
    exit 1
fi

echo "Window address: $address" >> "$logfile"

# Fetch fresh window info by address from clients list
client_info=$(hyprctl clients -j | jq -r --arg addr "$address" '.[] | select(.address==$addr)')
if [[ -z "$client_info" ]]; then
    echo "Could not find window info for address $address" | tee -a "$logfile"
    exit 1
fi

title=$(echo "$client_info" | jq -r '.title')
x=$(echo "$client_info" | jq -r '.at[0]')
y=$(echo "$client_info" | jq -r '.at[1]')
width=$(echo "$client_info" | jq -r '.size[0]')
height=$(echo "$client_info" | jq -r '.size[1]')
fullscreen=$(echo "$client_info" | jq -r '.fullscreen')
floating=$(echo "$client_info" | jq -r '.floating')

echo "Window info - Title: $title, x=$x y=$y w=$width h=$height fullscreen=$fullscreen floating=$floating" >> "$logfile"

# If fullscreen, toggle off
if [[ "$fullscreen" == "1" ]]; then
    echo "Window is fullscreen, toggling fullscreen OFF..." >> "$logfile"
    hyprctl dispatch fullscreen "$address" 0
    sleep 0.3
fi

# If not floating, toggle floating ON
if [[ "$floating" != "true" ]]; then
    echo "Window is not floating, toggling floating ON..." >> "$logfile"
    hyprctl dispatch togglefloating
    sleep 0.3
    # Verify floating status
    floating_after=$(hyprctl clients -j | jq -r --arg addr "$address" '.[] | select(.address==$addr) | .floating')
    echo "Floating after toggle: $floating_after" >> "$logfile"
    if [[ "$floating_after" != "true" ]]; then
        echo "Floating toggle did not apply, trying again..." >> "$logfile"
        hyprctl dispatch togglefloating "$address"
        sleep 0.3
    fi
fi

# Focus the window to ensure visibility
echo "Focusing window $address..." >> "$logfile"
hyprctl dispatch focuswindow address="$address"
sleep 0.3

# Save window info for restore
echo "$client_info" > ~/.local/share/hypr-hide/"$address".json

# Prepare screenshot path
screenshot_path="$HOME/.local/share/hypr-hide/${address}.png"
output="/home/tristank/.local/share/hypr-hide/${address}.png"

# Get window info JSON
clients_json=$(hyprctl clients -j)

# Extract geometry (x, y, width, height) for window by address
x=$(echo "$clients_json" | jq -r ".[] | select(.address==\"$address\") | .at[0]")
y=$(echo "$clients_json" | jq -r ".[] | select(.address==\"$address\") | .at[1]")
w=$(echo "$clients_json" | jq -r ".[] | select(.address==\"$address\") | .size[0]")
h=$(echo "$clients_json" | jq -r ".[] | select(.address==\"$address\") | .size[1]")

if [[ -z "$x" || -z "$y" || -z "$w" || -z "$h" ]]; then
  echo "Window $address not found or missing geometry"
  exit 1
fi

echo "Focusing window $address..."
hyprctl dispatch focuswindow address:$address

# Wait a bit for focus
sleep 0.1

echo "Taking screenshot at geometry: $x,$y ${w}x${h}"
grim -g "${x},${y} ${w}x${h}" "$output"

echo "Screenshot saved to $output"

# Move window offscreen after screenshot
hyprctl dispatch moveactive 5000 5000
echo "Moved window offscreen." >> "$logfile"

# Confirm new window position and floating state
after_move=$(hyprctl clients -j | jq -r --arg addr "$address" '.[] | select(.address==$addr) | {at, fullscreen, floating}')
echo "After move state: $after_move" >> "$logfile"
