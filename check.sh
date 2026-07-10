#!/bin/bash
set -e
PKG_FILE="$1"

echo "Testing catenary-bin..."
if [ -z "$PKG_FILE" ]; then
    echo "Error: Package file not provided"
    exit 1
fi

# Install the package (prebuilt binary; pulls gcc-libs).
sudo pacman -U --noconfirm "$PKG_FILE"

# Smoke test: confirm the prebuilt binary runs. `catenary version` prints
# the CLI version plus the daemon probe ("daemon: not running" in a clean
# container) and exits 0 without a daemon; --help must exit 0.
if catenary version && catenary --help > /dev/null; then
    echo "catenary smoke test passed."
else
    echo "Error: catenary smoke test failed."
    exit 1
fi
