#!/bin/bash
set -e
PKG_FILE="$1"

echo "Testing lattice-markdown-bin..."
if [ -z "$PKG_FILE" ]; then
    echo "Error: Package file not provided"
    exit 1
fi

# Install the package (prebuilt binary; pulls gcc-libs).
sudo pacman -U --noconfirm "$PKG_FILE"

# Smoke test: confirm the prebuilt binary runs and links against gcc-libs.
# --version prints the upstream version (lattice 0.5.0 (<sha>)); lint must
# exit 0 on a trivially clean workspace.
WORKDIR=$(mktemp -d)
trap 'rm -rf "$WORKDIR"' EXIT
echo "# Hello" > "$WORKDIR/README.md"
if lattice --version && (cd "$WORKDIR" && lattice lint); then
    echo "lattice smoke test passed."
else
    echo "Error: lattice smoke test failed."
    exit 1
fi
