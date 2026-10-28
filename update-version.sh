#!/bin/sh

# Get new version info
tmp=$(mktemp) || exit 1
trap 'rm -f "$tmp"' EXIT
VER=$(curl -fL 'https://download.termius.com/linux/Termius.deb' -o "$tmp" && dpkg-deb -f "$tmp" Version)

# Update PKGBUILD
sed -i "s/pkgver=.*$/pkgver=$VER/g" PKGBUILD

# Calc new hash 
updpkgsums

# Build & install pkg
makepkg -si

# Update .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Git ops
git add .SRCINFO PKGBUILD tos.html termius.desktop update-version.sh
git commit -m "Update to $VER"

# Cleanup
rm -rf pkg/ src/ *.pkg.tar.zst *.deb

printf "\nAll done!\nRemember to git push!\n"
