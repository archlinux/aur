#!/bin/bash
# ==============================================================================
# Hytale Launcher Wrapper for Arch Linux
#
# Author:      [SCDevel/root@scdevel.net]
# License:     MIT
# Description: Handles custom directory installation and environment variables for the Hytale Launcher.
#
# Disclaimer:  This script is an unofficial community tool and is not
#              affiliated with, endorsed by, or owned by Hypixel Studios Canada.
# ==============================================================================

# Time Sync Check
if ! command -v timedatectl &> /dev/null; then
    echo "WARN: 'timedatectl' command not found. Unable to check system clock synchronization."
elif timedatectl status | grep -qi "System clock synchronized: yes"; then
    echo "[OK] System clock is synchronized."
else
    echo "****************************************************"
    echo "WARNING: System clock is NOT synchronized!"
    echo "This may cause authentication errors in Hytale."
    echo "Run: sudo timedatectl set-ntp true"
    echo "****************************************************"
fi

# IPV6 Check
if [[ -f /proc/sys/net/ipv6/conf/all/disable_ipv6 ]]; then
    if [[ $(cat /proc/sys/net/ipv6/conf/all/disable_ipv6) -eq 1 ]]; then
        echo "****************************************************"
        echo "WARNING: IPv6 is DISABLED in your kernel settings!"
        echo "****************************************************"
    fi
else
    echo "WARN: Could not find IPv6 kernel settings file."
fi

if ! command -v ip &> /dev/null; then
    echo "WARN: 'ip' command not found. Unable to check network interface status."
else
    if ! ip -6 addr show | grep -q "scope global"; then
        echo "****************************************************"
        echo "WARNING: IPv6 is enabled, but no GLOBAL address found."
        echo "You may only have local connectivity."
        echo "****************************************************"
    else
        echo "[OK] IPv6 is enabled and has a global address."
    fi
fi

# NVIDIA Sync Fix
export __NV_DISABLE_EXPLICIT_SYNC=1

# Webkit Rendering Fix
export WEBKIT_DISABLE_DMABUF_RENDERER=1

export DESKTOP_STARTUP_ID=com.hypixel.HytaleLauncher

# Set XDG Specs.
: "${HYTALE_HOME:=$HOME}"
: "${XDG_DATA_HOME:=$HYTALE_HOME/.local/share}"
: "${XDG_CONFIG_HOME:=$HYTALE_HOME/.config}"
: "${XDG_CACHE_HOME:=$HYTALE_HOME/.cache}"

# Internal Script Dirs
LAUNCHER_DIR="${XDG_DATA_HOME}/hytale-launcher/bin"
SOURCE_DIR="/opt/hytale-launcher-bin"
BIN_NAME="hytale-launcher"
EDITOR_BIN="${XDG_DATA_HOME}/Hytale/install/release/package/game/latest/Client/NodeEditor/NodeEditor"

START_LAUNCHER=true
START_EDITOR=false

LAUNCHER_ARGS=()
for arg in "$@"; do
    case "$arg" in
        --editor)
            START_EDITOR=true
            ;;
        --onlyeditor)
            START_EDITOR=true
            START_LAUNCHER=false
            ;;
        *)
            # Keep any other arguments to pass to the launcher
            LAUNCHER_ARGS+=("$arg")
            ;;
    esac
done

# If the launcher isn't in the user's home yet, copy the files
if [ ! -d "$LAUNCHER_DIR" ]; then
    echo "Installing Hytale Launcher to $LAUNCHER_DIR..."
    mkdir -p "$LAUNCHER_DIR"
    cp -r "$SOURCE_DIR/$BIN_NAME" "$LAUNCHER_DIR/$BIN_NAME"
fi

# Just wanna make sure these are exported.
export HYTALE_HOME XDG_DATA_HOME XDG_CONFIG_HOME XDG_CACHE_HOME

# Handle Editor execution
if [ "$START_EDITOR" = true ]; then
    if [ -f "$EDITOR_BIN" ]; then
        echo "Starting Node Editor..."
        "$EDITOR_BIN" &
    else
        echo "Error: Node Editor not found at $EDITOR_BIN" >&2
        if [ "$START_LAUNCHER" = false ]; then
            exit 1
        fi
    fi
fi

# Switch to the directory and run the launcher
if [ "$START_LAUNCHER" = true ]; then
    cd "$LAUNCHER_DIR" || exit 1
    exec "./$BIN_NAME" "${LAUNCHER_ARGS[@]}"
fi
