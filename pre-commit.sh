#!/usr/bin/env bash
set -e

# Only act if PKGBUILD is staged
if ! git diff --cached --name-only --diff-filter=ACM | grep -qx 'PKGBUILD'; then
    exit 0
fi

# 1. Regenerate .SRCINFO
echo ">>> PKGBUILD staged — regenerating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO
git add .SRCINFO

# 2. Validate PKGBUILD with namcap (loose: errors block, warnings print)
if ! command -v namcap >/dev/null 2>&1; then
    echo "ERROR: namcap not installed." >&2
    echo "       Install with: sudo pacman -S namcap" >&2
    exit 1
fi

echo ">>> Running namcap on PKGBUILD..."
namcap_output=$(namcap PKGBUILD)
echo "$namcap_output"

if echo "$namcap_output" | grep -q '^PKGBUILD E:'; then
    echo "" >&2
    echo "ERROR: namcap reported errors. Fix them before committing." >&2
    exit 1
fi
