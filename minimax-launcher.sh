#!/bin/bash
# MiniMax launcher wrapper - auto-detects Wayland/X11

MINIMAX_BIN="/opt/minimax/minimax"

# Detect display server and set appropriate flags
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    exec "$MINIMAX_BIN" --enable-features=UseOzonePlatform --ozone-platform=wayland "$@"
elif [ -n "$DISPLAY" ]; then
    exec "$MINIMAX_BIN" "$@"
else
    # Fallback - try Wayland first, then X11
    if [ -n "$WAYLAND_DISPLAY" ]; then
        exec "$MINIMAX_BIN" --enable-features=UseOzonePlatform --ozone-platform=wayland "$@"
    else
        exec "$MINIMAX_BIN" "$@"
    fi
fi
