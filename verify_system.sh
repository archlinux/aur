#!/bin/bash
# LM Studio AUR Package Verification Script

echo "=== LM Studio AUR Verification ==="

# 1. Icon Existence Check
echo "[1/4] Checking Icon Sources..."
if [ -f "/usr/share/pixmaps/lmstudio-bin.png" ]; then
    echo "✓ Found lmstudio-bin pixmap icon"
else
    echo "✗ MISSING: lmstudio-bin pixmap icon"
    exit 1
fi

if [ -f "squashfs-root/resources/app/.webpack/Icon-512x512.png" ]; then
    echo "✓ Found 512x512 source icon"
else
    echo "✗ MISSING: 512x512 source icon"
    exit 1
fi

# 2. Desktop File Verification
echo "[2/4] Verifying Desktop Entry..."
ICON_NAME=$(grep "^Icon=" lmstudio.desktop | cut -d'=' -f2)
if [ "$ICON_NAME" == "lmstudio-bin" ]; then
    echo "✓ Desktop Icon name matches: $ICON_NAME"
else
    echo "✗ Desktop Icon mismatch: $ICON_NAME (expected lmstudio-bin)"
    exit 1
fi

# 3. PKGBUILD Consistency
echo "[3/4] Verifying PKGBUILD Icon Mapping..."
grep -q "lmstudio-bin.png" PKGBUILD
if [ $? -eq 0 ]; then
    echo "✓ PKGBUILD contains lmstudio-bin.png mapping"
else
    echo "✗ PKGBUILD missing icon installation logic"
    exit 1
fi

# 4. Bin Linkage
echo "[4/4] Verifying Binary Naming..."
EXEC_CMD=$(grep "^Exec=" lmstudio.desktop | cut -d'=' -f2 | cut -d' ' -f1)
grep -q "ln -s .* \"\$pkgdir/usr/bin/$EXEC_CMD\"" PKGBUILD
if [ $? -eq 0 ]; then
    echo "✓ PKGBUILD symlink matches desktop Exec: $EXEC_CMD"
else
    echo "✗ PKGBUILD symlink mismatch with desktop Exec"
    exit 1
fi

echo "=== SYSTEM GREEN ==="
