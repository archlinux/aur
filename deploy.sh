#!/usr/bin/env bash
set -euo pipefail

makepkg --nobuild --holdver
makepkg --printsrcinfo > .SRCINFO

pkgver=$(grep '^\s*pkgver' .SRCINFO | head -1 | awk '{print $3}')

git add .SRCINFO PKGBUILD
git commit -m "Update PKGBUILD and .SRCINFO for version ${pkgver}"
git push origin master

# Remove build artifacts
rm -rf src/ pkg/ solidc/ *.tar.gz *.pkg.tar.zst
rm -rf solidc