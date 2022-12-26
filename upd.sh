#!/bin/sh

# Get new version info
URL=$(curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/termius-app | jq '.download_url' -r | cut -d "_" -f2)
VER=$(curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/termius-app | jq '.version' -r)

# Update PKGBUILD
sed -i "s/_[0-9]\+.snap/_$URL/g" PKGBUILD
sed -i "s/pkgver=.*$/pkgver=$VER/g" PKGBUILD 

# Calc new hash 
updpkgsums

# Build & install pkg
makepkg -si

# Update .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Git ops
git add .SRCINFO PKGBUILD
git commit -m "Update to $VER"

# Cleanup
rm -rf pkg/ src/ *.snap *.pkg.tar.zst

printf "\nAll done!\nRemember to git push!\n"
