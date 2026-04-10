#!/bin/bash
# Update dots-hyprland-fork-git AUR package
set -e
cd "$(dirname "$0")"

# Regenerate .SRCINFO
echo "Regenerating .SRCINFO..."
{
  echo "pkgbase = dots-hyprland-fork-git"
  grep -E '^(pkgdesc|pkgver|pkgrel|url|arch|license)=' PKGBUILD | sed 's/^/	pkgdesc = /'
  grep -E '^depends|^makedepends' PKGBUILD | sed 's/^/	/'
  echo "	source = git+https://github.com/LIghtJUNction/dots-hyprland.git"
  echo "	sha256sums = SKIP"
  echo
  echo "	pkgname = dots-hyprland-fork-git"
} > .SRCINFO

git add PKGBUILD .SRCINFO
git commit -m "Update: $(date '+%Y-%m-%d %H:%M')"
git push
echo "Done."
