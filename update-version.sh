#!/bin/sh

# Get new version info
VER=$(curl https://www.microsip.org/check-version | grep "Update available" | cut -d ':' -f2 | cut -d '<' -f1 | xargs)

# Update PKGBUILD
sed -i "s/pkgver=.*$/pkgver=$VER/g" PKGBUILD 

# Calc new hash 
updpkgsums

# Build & install pkg
makepkg -si

# Update .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Git ops
git add .SRCINFO PKGBUILD microsip microsip.desktop microsip.png microsip.reg update-version.sh
git commit -m "Update to $VER"

# Cleanup
rm -rf pkg/ src/ *.pkg.tar.zst MicroSIP-Lite-*.zip

printf "\nAll done!\nRemember to git push!\n"
