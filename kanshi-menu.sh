#!/usr/bin/env bash

# Detect kanshi config
CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/kanshi/config"

# Extract profile names (lines starting with 'profile NAME {')
profiles=$(grep -oP '^profile\s+\K[^ ]+' "$CONFIG")

# Let the user pick a profile via fzf (terminal UI)
choice=$(printf "%s\n" $profiles | fzf --prompt="Select kanshi profile: ")

[ -z "$choice" ] && exit 0

# Reload kanshi with selected profile
notify-send "Kanshi" "Switching to profile: $choice"

kanshictl switch $choice

