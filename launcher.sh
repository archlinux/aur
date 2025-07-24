#!/bin/bash

set -e

# Check and start D-Bus if necessary
if [ ! -S "/run/dbus/system_bus_socket" ] && [ ! -S "/var/run/dbus/system_bus_socket" ]; then
    echo "Warning: D-Bus system bus is not available"
    export DBUS_SESSION_BUS_ADDRESS="unix:path=/dev/null"
fi

# Set hostname if the command is not available
if ! command -v hostname >/dev/null 2>&1; then
    export HOSTNAME="${HOSTNAME:-localhost}"
fi

CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
CONFIG_FILE="${PERPLEXITY_CONFIG:-$CONFIG_HOME/Perplexity/perplexity.conf}"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Config not found, copying default"
    mkdir -p "$(dirname "$CONFIG_FILE")"
    cp /etc/perplexity/default.conf "$CONFIG_FILE"
fi

# shellcheck source=/dev/null
source "$CONFIG_FILE"

# Set additional flags depending on session type
# See https://www.electronjs.org/docs/latest/api/command-line-switches/ for more
SESSION_FLAGS=""
if [ "$XDG_SESSION_TYPE" == "wayland" ] || [ -n "$WAYLAND_DISPLAY" ]; then
    # Flags for Wayland
    SESSION_FLAGS=""
elif [ "$XDG_SESSION_TYPE" == "x11" ] || [ -n "$DISPLAY" ]; then
    # Flags for X11
    SESSION_FLAGS="--ozone-platform=x11 --enable-gpu-rasterization --enable-zero-copy --ignore-gpu-blacklist"
    # Remove --disable-gpu for X11 if present in ELECTRON_ARGS
    ELECTRON_ARGS=$(echo "$ELECTRON_ARGS" | sed 's/--disable-gpu//g')
else
    # Fallback for unknown session
    SESSION_FLAGS="--disable-gpu --disable-software-rasterizer"
fi

ELECTRON_BIN=${ELECTRON_CUSTOM_BIN:-/usr/bin/electron}

export TRAY_ENABLED=${TRAY_ENABLED:-0}
export DEV_TOOLS=${DEV_TOOLS:-0}

# Combine all flags into a single string
ALL_FLAGS="$ELECTRON_ARGS $SESSION_FLAGS"

exec "$ELECTRON_BIN" "/usr/lib/perplexity" $ALL_FLAGS "$@"
