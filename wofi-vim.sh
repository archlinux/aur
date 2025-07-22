#!/usr/bin/env bash

SHEET="$HOME/.config/vimcheet.txt"

if [[ ! -f "$SHEET" ]]; then
  echo "Cheat sheet file not found: $SHEET" >&2
  exit 1
fi

# Show list via wofi (dmenu mode), hide after selection
action=$(cat "$SHEET" | wofi --dmenu --prompt="Vim action")

# If no selection (Esc or empty), exit
if [[ -z "$action" ]]; then
  exit 0
fi

# Output the chosen Vim command
printf '%s' "$action"

