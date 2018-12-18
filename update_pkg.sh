#!/bin/bash
REPO='http://security.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/'
PACKAGE=$(wget -qO- $REPO | sed -rn "s/.*(chromium-codecs-ffmpeg-extra_(.*?)-(.*?18\.10\.[1-9])_amd64.deb).*/\1#\2#\3/p" | sort | tail -n 1)

deb=$(echo $PACKAGE | cut -d# -f1)
ver1=$(echo $PACKAGE | cut -d# -f2)
ver2=$(echo $PACKAGE | cut -d# -f3)

cur=$(pwd)
tmp=$(mktemp -d)
cd $tmp
wget -q "$REPO$deb"
md5=$(md5sum $deb | cut -d\  -f1)
cd $cur

sed -i "s|^pkgver=.*$|pkgver=${ver1}|" PKGBUILD
sed -i "s|^pkgver2=.*$|pkgver2=${ver2}|" PKGBUILD
sed -i "s|^md5sums.*$|md5sums=(\"${md5}\")|" PKGBUILD

makepkg --printsrcinfo > .SRCINFO
