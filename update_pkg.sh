#!/bin/bash
REPO='http://security.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/'
PACKAGE=$(wget -qO- $REPO | perl -ne '/(?<=href=")(chromium-codecs-ffmpeg-extra_(.*?)-(\w{8}).(.*?)_amd64.deb)(?=")/ and print "$1#$2#$3#$4\n";' | sort | tail -n 1)

deb=$(echo $PACKAGE | cut -d# -f1)
ver1=$(echo $PACKAGE | cut -d# -f2)
ver2=$(echo $PACKAGE | cut -d# -f3)
ver3=$(echo $PACKAGE | cut -d# -f4)

cur=$(pwd)
tmp=$(mktemp -d)
cd $tmp
wget -q "$REPO$deb"
md5=$(md5sum $deb | cut -d\  -f1)
cd $cur

sed -i "s|^pkgver=.*$|pkgver=${ver1}|" PKGBUILD
sed -i "s|^pkgver2=.*$|pkgver2=${ver2}|" PKGBUILD
sed -i "s|^pkgver3=.*$|pkgver3=${ver3}|" PKGBUILD
sed -i "s|^md5sums.*$|md5sums=(\"${md5}\")|" PKGBUILD

makepkg --printsrcinfo > .SRCINFO
