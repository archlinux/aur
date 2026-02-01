#!/bin/bash
# LM Studio AUR Package Verification Script
# Updated: Checks for vendored lmstudio.png in root, makes /usr/share checks informative in dev environments

echo "=== LM Studio AUR Verification ==="
echo ""

# 1. Vendored Icon Existence Check (Primary)
echo "[1/4] Checking Vendored Icon..."
if [ -f "./lmstudio.png" ]; then
    echo "✓ Found vendored lmstudio.png in root"
else
    echo "✗ MISSING: vendored lmstudio.png in root"
    exit 1
fi
echo ""

# 2. System Icon Installation Check (Informative)
echo "[2/4] Checking System Icon Installation..."
if [ -f "/usr/share/pixmaps/lmstudio-bin.png" ]; then
    echo "✓ Found lmstudio-bin pixmap icon in /usr/share"
else
    echo "ℹ INFO: lmstudio-bin pixmap not in /usr/share (expected in non-installed dev environment)"
fi
echo ""

# 3. Desktop File Verification
echo "[3/4] Verifying Desktop Entry..."
ICON_NAME=$(grep "^Icon=" lmstudio.desktop | cut -d'=' -f2)
if [ "$ICON_NAME" == "lmstudio-bin" ]; then
    echo "✓ Desktop Icon name matches: $ICON_NAME"
else
    echo "✗ Desktop Icon mismatch: $ICON_NAME (expected lmstudio-bin)"
    exit 1
fi
echo ""

# 4. PKGBUILD Consistency
echo "[4/4] Verifying PKGBUILD Icon Mapping..."
grep -q "lmstudio.png" PKGBUILD
if [ $? -eq 0 ]; then
    echo "✓ PKGBUILD contains lmstudio.png mapping"
else
    echo "✗ PKGBUILD missing icon installation logic"
    exit 1
fi
echo ""

echo "=== SYSTEM GREEN ==="
