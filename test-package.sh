#!/bin/bash
set -e
echo "=== 1. Static Analysis (namcap) ==="
namcap PKGBUILD
echo "=== 2. Clean Chroot Build ==="
extra-x86_64-build
echo "=== 3. Post-Build Analysis ==="
PKG_FILE=$(ls -1 *.pkg.tar.zst | grep -v debug | head -n 1)
namcap "$PKG_FILE"
echo "=== SUCCESS ==="
