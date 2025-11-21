#!/bin/bash
# Kiro launcher wrapper - auto-detects Wayland/X11

KIRO_BIN="/opt/Kiro/kiro"

# Detect display server and set appropriate flags
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    exec "$KIRO_BIN" --enable-features=UseOzonePlatform --ozone-platform=wayland "$@"
elif [ -n "$DISPLAY" ]; then
    exec "$KIRO_BIN" "$@"
else
    # Fallback - try Wayland first, then X11
    if [ -n "$WAYLAND_DISPLAY" ]; then
        exec "$KIRO_BIN" --enable-features=UseOzonePlatform --ozone-platform=wayland "$@"
    else
        exec "$KIRO_BIN" "$@"
    fi
fi
