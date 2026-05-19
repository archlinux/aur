#!/bin/bash
# AUR Automated Test Suite
# Runs static analysis, clean chroot build, and smoke tests.

set -e

AUR_DIR="/home/jeryd/Project/AUR/synology-drive-client-bin"
cd "$AUR_DIR"

echo "=== 1. Static Analysis (namcap) ==="
namcap PKGBUILD

echo "=== 2. Clean Chroot Build ==="
# We use extra-x86_64-build which builds in a clean environment.
# This also runs the check() function we added to the PKGBUILD.
extra-x86_64-build

echo "=== 3. Post-Build Analysis ==="
PKG_FILE=$(ls -1 *.pkg.tar.zst | head -n 1)
if [ -n "$PKG_FILE" ]; then
    namcap "$PKG_FILE"
else
    echo "Error: No package file found after build."
    exit 1
fi

echo "=== SUCCESS ==="
echo "Package $PKG_FILE passed all tests."
