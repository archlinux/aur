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

# CONSTANTS
DEFAULT_DIR="$HOME/.local/share/Hytale/install/release/package/launcher/current"
LAUNCHER_DIR="$DEFAULT_DIR"
SOURCE_DIR="/opt/hytale-launcher-bin"
BIN_NAME="hytale-launcher"



# 2. Handle Command Line Arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -d|--directory) LAUNCHER_DIR="$2"; shift ;;
        -h|--help)
            echo "Usage: hytale-launcher [options]"
            echo "Options:"
            echo "  -d, --directory PATH    Specify a custom installation directory"
            echo "  -h, --help              Show this help message"
            exit 0
            ;;
    esac
    shift
done

# If the launcher isn't in the user's home yet, copy the files
if [ ! -d "$LAUNCHER_DIR" ]; then
    echo "Installing Hytale Launcher to $LAUNCHER_DIR..."
    mkdir -p "$LAUNCHER_DIR"
    cp -r "$SOURCE_DIR/$BIN_NAME" "$LAUNCHER_DIR/$BIN_NAME"
fi

# Switch to the directory and run it
cd "$LAUNCHER_DIR"
exec "./$BIN_NAME" "$@"
