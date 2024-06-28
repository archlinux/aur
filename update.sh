#!/bin/sh

# Script to help the package maintainer(s).
# Don't worry about this file if you're just installing the package.
# Requires xq, wget

set -o errexit

rm -rf ./squashfs-root
wget --no-clobber 'https://github.com/stenzek/duckstation/releases/download/latest/DuckStation-x64.AppImage'

chmod u+x ./DuckStation-x64.AppImage
./DuckStation-x64.AppImage --appimage-extract

version="$(xq -r '.component.releases.release["@version"]' < squashfs-root/usr/share/metainfo/org.duckstation.DuckStation.metainfo.xml)"
version="${version%-*}"
revision="${version#0\.1-}"
echo "Revision: $revision"
sed -i "s/^pkgver=.*$/pkgver=0.1.r${revision}/" PKGBUILD

mv DuckStation-x64.AppImage "duckstation-qt-0.1.r${revision}.AppImage"

updpkgsums 
makepkg --printsrcinfo > .SRCINFO

git add .
git commit -m "Revision $revision"
