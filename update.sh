#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "usage: $0 <version>"
  echo "example: $0 0.1.10"
  exit 2
fi

version="${1#v}"

sed -i "s/^pkgver=.*/pkgver=${version}/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

updpkgsums
makepkg --printsrcinfo > .SRCINFO
makepkg -f

git diff -- PKGBUILD .SRCINFO

echo
echo "Review the diff above, then publish with:"
echo "  git add PKGBUILD .SRCINFO"
echo "  git commit -m 'Update to ${version}'"
echo "  git push"
