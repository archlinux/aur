#!/usr/bin/env bash
# Publish the package to the AUR: refresh .SRCINFO, commit and push.
# Needs the SSH key registered in the AUR account.
set -euo pipefail
cd "$(dirname "$0")"

pkgver=$(sed -n 's/^pkgver=\(.*\)/\1/p' PKGBUILD | head -n1)
pkgrel=$(sed -n 's/^pkgrel=\(.*\)/\1/p' PKGBUILD | head -n1)

makepkg --printsrcinfo > .SRCINFO
git add -A
if git diff --cached --quiet; then
  echo "nada a commitar"
else
  git commit -q -m "tracedraw-bin ${pkgver}-${pkgrel}"
fi

git push -u origin master
echo "publicado: https://aur.archlinux.org/packages/tracedraw-bin"
