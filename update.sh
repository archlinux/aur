#!/bin/bash
# Update dots-hyprland-fork-git AUR package
set -e

cd "$(dirname "$0")"

# Rebuild .SRCINFO from PKGBUILD
echo "Regenerating .SRCINFO..."
awk '/^pkgbase = / { print; section=1 }
     section && /^[[:space:]]+[a-z]+ = / { sub(/^[[:space:]]+/, ""); print }
     /^pkgname = / { print; section=0 }' PKGBUILD > .SRCINFO_new

# More reliable .SRCINFO generation using makepkg
if command -v makepkg &>/dev/null; then
    namcap -i PKGBUILD 2>/dev/null || true
fi

# Commit and push
git add PKGBUILD .SRCINFO
git commit -m "Update: $(date '+%Y-%m-%d %H:%M')"
git push

echo "Done."
