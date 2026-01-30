#!/bin/bash
set -e
PKG_FILE="$1"

echo "Testing keeper-secrets-manager-cli..."
if [ -z "$PKG_FILE" ]; then
    echo "Error: Package file not provided"
    exit 1
fi

# Install the package
sudo pacman -U --noconfirm "$PKG_FILE"

# Run version check
# 'ksm' is the command name
if ksm version; then
    echo "ksm version passed."
else
    echo "Error: ksm version failed."
    exit 1
fi
