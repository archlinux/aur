#!/bin/bash
# apply-brave-wayland.sh
# Script to apply Wayland support to Brave browser
# Executed by pacman hook when brave-bin is installed or updated

set -e

BRAVE_SCRIPT="/usr/bin/brave"
BRAVE_SCRIPT_BACKUP="/usr/bin/brave.orig"
BRAVE_BIN="/opt/brave-bin/brave"

echo "==> Applying Wayland support to Brave browser..."

# Check if brave-bin exists
if [ ! -f "$BRAVE_BIN" ]; then
    echo "Warning: brave-bin binary not found at $BRAVE_BIN"
    echo "Skipping Wayland hook application"
    exit 0
fi

# Backup original script if it exists and we haven't backed it up yet
if [ -f "$BRAVE_SCRIPT" ] && [ ! -f "$BRAVE_SCRIPT_BACKUP" ]; then
    echo "==> Backing up original brave script to $BRAVE_SCRIPT_BACKUP"
    cp "$BRAVE_SCRIPT" "$BRAVE_SCRIPT_BACKUP"
fi

# Create the Wayland-enabled brave launcher script
echo "==> Creating Wayland-enabled brave launcher..."
cat > "$BRAVE_SCRIPT" << 'EOF'
#!/usr/bin/env bash
# Brave launcher with Wayland support
# Modified by brave-hook-wayland package

# Set XDG config directory
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"${HOME}/.config"}"
CONF_FILE="${XDG_CONFIG_HOME}/brave-flags.conf"

# Get the original brave binary path
BRAVE_BIN="/opt/brave-bin/brave"

# Check if brave-bin exists
if [ ! -f "$BRAVE_BIN" ]; then
    echo "Error: brave-bin not found at $BRAVE_BIN"
    exit 1
fi

# Initialize flag list
FLAG_LIST=()

# Check if running under Wayland and add Wayland-specific flags
if [[ "${XDG_SESSION_TYPE}" == "wayland" ]]; then
    FLAG_LIST+=(
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
        "--enable-wayland-ime"
        "--wayland-text-input-version=1"
    )
fi

# Read configuration file if it exists
if test -f "${CONF_FILE}"; then
    mapfile -t CONF_LIST < "${CONF_FILE}"

    # Process configuration lines and add to flag list
    for CONF_LINE in "${CONF_LIST[@]}"; do
        if ! [[ "${CONF_LINE}" =~ ^[[:space:]]*(#|$) ]]; then
            FLAG_LIST+=("${CONF_LINE}")
        fi
    done
fi

# Set Chrome version
export CHROME_VERSION_EXTRA='stable'

# Execute brave with appropriate flags
exec "$BRAVE_BIN" "${FLAG_LIST[@]}" "$@"
EOF

# Make the script executable
chmod +x "$BRAVE_SCRIPT"

echo "==> Wayland support applied to Brave browser successfully!"
echo "==> Brave will now launch with Wayland support by default"
