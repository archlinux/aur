#!/usr/bin/env bash
# Bump python-pykrx to a new upstream release.
#
# Usage:
#   ./update.sh 1.2.9      # update to a specific version
#   ./update.sh            # auto-detect the latest version from PyPI
#
# Steps performed:
#   1. set pkgver (and reset pkgrel to 1)
#   2. refresh sha256sums from the real tarball (updpkgsums)
#   3. regenerate .SRCINFO
#   4. build the package once to make sure it still works (makepkg -f)
set -euo pipefail

cd "$(dirname "$0")"

new_ver="${1:-}"
if [[ -z "$new_ver" ]]; then
  echo ">> Querying PyPI for the latest pykrx version..."
  new_ver=$(curl -fsSL https://pypi.org/pypi/pykrx/json |
    python -c 'import json,sys; print(json.load(sys.stdin)["info"]["version"])')
fi

cur_ver=$(grep -Po '^pkgver=\K.*' PKGBUILD)
echo ">> Current: $cur_ver   New: $new_ver"

if [[ "$new_ver" == "$cur_ver" ]]; then
  echo ">> Already at $new_ver; nothing to do."
  exit 0
fi

sed -i -E "s/^pkgver=.*/pkgver=$new_ver/" PKGBUILD
sed -i -E "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

echo ">> Refreshing checksums..."
updpkgsums

echo ">> Regenerating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo ">> Test build..."
makepkg -f

echo ">> Done. Review the diff, then commit:"
echo "     git add PKGBUILD .SRCINFO"
echo "     git commit -m 'Update to $new_ver'"
echo "     git push"
