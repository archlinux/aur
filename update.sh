#!/bin/bash
# Bump the AUR package to a new release: ./update.sh [version]
# With no argument, uses the latest GitHub release tag.
# Fetches the .deb, computes real sha256sums (updpkgsums), regenerates
# .SRCINFO, and commits — review, then `git push`.
set -euo pipefail
cd "$(dirname "$0")"

ver="${1:-}"
if [[ -z "$ver" ]]; then
  ver="$(curl -fsSL https://api.github.com/repos/chwair/magnolia/releases/latest \
    | grep -Po '"tag_name":\s*"v?\K[^"]+')"
fi
echo "==> updating to ${ver}"

sed -i "s/^pkgver=.*/pkgver=${ver}/; s/^pkgrel=.*/pkgrel=1/" PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO

git add PKGBUILD .SRCINFO
git commit -m "update to ${ver}"
echo "==> committed. review with 'git show', then: git push"
