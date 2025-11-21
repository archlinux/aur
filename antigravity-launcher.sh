#!/bin/bash
# Antigravity launcher wrapper - auto-detects Wayland/X11

ANTIGRAVITY_BIN="/opt/antigravity/Antigravity"

# Check if binary exists (might be lowercase)
if [ ! -f "$ANTIGRAVITY_BIN" ]; then
    ANTIGRAVITY_BIN="/opt/antigravity/antigravity"
fi

# Detect display server and set appropriate flags
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    exec "$ANTIGRAVITY_BIN" --enable-features=UseOzonePlatform --ozone-platform=wayland "$@"
elif [ -n "$DISPLAY" ]; then
    exec "$ANTIGRAVITY_BIN" "$@"
else
    # Fallback - try Wayland first, then X11
    if [ -n "$WAYLAND_DISPLAY" ]; then
        exec "$ANTIGRAVITY_BIN" --enable-features=UseOzonePlatform --ozone-platform=wayland "$@"
    else
        exec "$ANTIGRAVITY_BIN" "$@"
    fi
fi
