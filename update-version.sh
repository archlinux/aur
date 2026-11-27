#!/bin/sh

# Get new version info
VER=$([[ $(curl -fsSL 'https://www.softmaker.de/support/installation/linux/office-nx') =~ softmaker-office-nx-([0-9]+)-amd64\.tgz ]] && echo "${BASH_REMATCH[1]}")

# Update PKGBUILD
sed -i "s/pkgver=.*$/pkgver=$VER/g" PKGBUILD

# Calc new hash 
updpkgsums

# Build & install pkg
makepkg -si

# Update .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Git ops
git add PKGBUILD planmakernx planmaker-nx.desktop presentationsnx presentations-nx.desktop softmaker-office-nx.xml .SRCINFO textmakernx textmaker-nx.desktop update-version.sh
git commit -m "Update to $VER"

# Cleanup
rm -rf pkg/ src/ *.pkg.tar.zst *.tgzj

printf "\nAll done!\nRemember to git push!\n"
