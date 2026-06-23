#!/bin/bash
set -e
PKG_FILE="$1"

echo "Testing themis-bin..."
if [ -z "$PKG_FILE" ]; then
    echo "Error: Package file not provided"
    exit 1
fi

# Install the package (prebuilt binary; pulls gcc-libs).
sudo pacman -U --noconfirm "$PKG_FILE"

# Smoke test: confirm the prebuilt binary runs and links against gcc-libs.
# --version prints the upstream version (themis 0.1.0); --help must exit 0.
if themis --version && themis --help > /dev/null; then
    echo "themis smoke test passed."
else
    echo "Error: themis smoke test failed."
    exit 1
fi
