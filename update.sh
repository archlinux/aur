#!/bin/sh
# Refresh pkgver/.SRCINFO and commit.
set -e

cd "$(dirname "$0")"
makepkg -od --noconfirm
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO

if git diff --cached --quiet; then
    exit 0
fi

ver=$(sed -n 's/^pkgver=//p' PKGBUILD)-$(sed -n 's/^pkgrel=//p' PKGBUILD)
git commit -m "upgpkg: $ver"
