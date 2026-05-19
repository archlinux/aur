#!/bin/bash
# Universal Terminal Launcher Wrapper for BleachBit-TUI
# This ensures the TUI launches regardless of the Desktop Environment's 
# handling of the Terminal=true flag.

COMMAND="bleachbit-tui"

# Try the proposed XDG standard first
if command -v xdg-terminal-exec >/dev/null 2>&1; then
    exec xdg-terminal-exec "$COMMAND"
fi

# Fallback to a priority list of common terminal emulators
TERMINALS=(
    "kitty --"
    "alacritty -e"
    "foot -e"
    "wezterm -e"
    "ghostty -e"
    "konsole -e"
    "gnome-terminal --"
    "xfce4-terminal -e"
    "lxterminal -e"
    "terminator -x"
    "tilix -e"
    "urxvt -e"
    "st -e"
    "xterm -e"
)

for term in "${TERMINALS[@]}"; do
    cmd=$(echo "$term" | awk '{print $1}')
    args=$(echo "$term" | cut -d' ' -f2-)
    
    if command -v "$cmd" >/dev/null 2>&1; then
        exec "$cmd" $args "$COMMAND"
    fi
done

# If all fails, try running it directly (will fail if no terminal context exists)
exec "$COMMAND"
