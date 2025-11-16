#!/bin/bash

set -e

USER_HOME="${1:-$HOME}"

if [ -z "$USER_HOME" ] || [ "$USER_HOME" = "/root" ]; then
    if [ -n "$SUDO_USER" ]; then
        USER_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)
    elif [ -n "$REAL_USER" ]; then
        USER_HOME=$(getent passwd "$REAL_USER" | cut -d: -f6)
    else
        REAL_USER=$(who am i 2>/dev/null | awk '{print $1}' || echo "")
        if [ -n "$REAL_USER" ]; then
            USER_HOME=$(getent passwd "$REAL_USER" | cut -d: -f6)
        fi
    fi
fi

if [ -z "$USER_HOME" ] || [ "$USER_HOME" = "/root" ]; then
    echo "Error: Could not determine user home directory. Please run as: openvr-lighthouse-manager-linux-install /home/username" >&2
    exit 1
fi

if [ ! -d "$USER_HOME" ]; then
    echo "Error: User home directory does not exist: $USER_HOME" >&2
    exit 1
fi

STEAMVR_DRIVERS_DIR="$USER_HOME/.local/share/SteamVR/drivers/lighthouse-manager/bin/linux64"
PKG_DIR="/usr/lib/openvr-lighthouse-manager-linux"

if [ ! -d "$PKG_DIR" ]; then
    echo "Error: Package files not found at $PKG_DIR"
    echo "Please ensure openvr-lighthouse-manager-linux is installed."
    exit 1
fi

mkdir -p "$STEAMVR_DRIVERS_DIR"

echo "Installing Lighthouse Manager to SteamVR for $USER_HOME..."

OWNER_USER=$(stat -c '%U' "$USER_HOME" 2>/dev/null || echo "")
OWNER_GROUP=$(stat -c '%G' "$USER_HOME" 2>/dev/null || echo "")

# Copy binaries
cp /usr/bin/lighthouse-manager "$STEAMVR_DRIVERS_DIR/"
cp /usr/bin/lighthouse-manager-gui "$STEAMVR_DRIVERS_DIR/"
chmod +x "$STEAMVR_DRIVERS_DIR/lighthouse-manager"
chmod +x "$STEAMVR_DRIVERS_DIR/lighthouse-manager-gui"

# Copy manifest
cp "$PKG_DIR/manifest.vrmanifest" "$STEAMVR_DRIVERS_DIR/"

if [ -n "$OWNER_USER" ] && [ "$(id -u)" -eq 0 ]; then
    chown -R "$OWNER_USER:$OWNER_GROUP" "$STEAMVR_DRIVERS_DIR" 2>/dev/null || true
fi

MANIFEST_PATH="$STEAMVR_DRIVERS_DIR/manifest.vrmanifest"
echo ""
echo "Registering overlay manifest..."

if [ -f "$MANIFEST_PATH" ]; then
    # Try to register using lighthouse-manager binary if it supports --register-manifest
    if [ -f "$STEAMVR_DRIVERS_DIR/lighthouse-manager" ]; then
        OPENVR_LIB_PATH=""
        for lib_path in \
            "$USER_HOME/.local/share/Steam/steamapps/common/SteamVR/bin/linux64" \
            "$USER_HOME/.steam/steam/steamapps/common/SteamVR/bin/linux64" \
            "$USER_HOME/.steam/root/steamapps/common/SteamVR/bin/linux64"; do
            if [ -f "$lib_path/libopenvr_api.so" ]; then
                OPENVR_LIB_PATH="$lib_path"
                break
            fi
        done
        
        if [ -n "$OPENVR_LIB_PATH" ]; then
            # Suppress all output and errors (expected when SteamVR is not running)
            # Only show a clean message based on exit code
            if LD_LIBRARY_PATH="$OPENVR_LIB_PATH:$LD_LIBRARY_PATH" "$STEAMVR_DRIVERS_DIR/lighthouse-manager" --register-manifest >/dev/null 2>&1; then
                echo "Overlay registered successfully"
            else
                echo "Note: Overlay will register itself on first run (SteamVR not running)"
            fi
        else
            echo "Note: Could not find OpenVR library. Overlay will register itself on first run."
        fi
    else
        echo "Note: Overlay will register itself on first run."
    fi
else
    echo "Warning: Manifest file not found at $MANIFEST_PATH"
fi

echo ""
echo "Installation complete!"
echo "Restart SteamVR to activate the overlay."

