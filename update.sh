#!/usr/bin/env bash
set -euo pipefail
pkgver=$(curl -s "https://api.github.com/repos/linux-jm/manual/releases/latest"|jq -r '.tag_name | sub("^v"; "")')
sed -i "s/pkgver=.*/pkgver=${pkgver}/" PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
echo "Updated to $pkgver"
git add PKGBUILD .SRCINFO
