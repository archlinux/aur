#!/bin/bash

echo "Current version:"
grep "pkgver=" PKGBUILD
grep "pkgver2=" PKGBUILD
grep "pkgver3=" PKGBUILD

echo "Searching for updates..."

REPO='http://security.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/'
PACKAGE=$(wget -qO- $REPO | perl -ne '/(?<=href=")(chromium-codecs-ffmpeg-extra_(\d*\.\d*\.\d*\.\d*)-(\dubuntu\d).(\d{2}\.\d{2}(?:\.\d)?)_amd64.deb)(?=").*\d*\.\d*M/ and print "$1#$2#$3#$4\n";' | sort | tail -n 1)

deb=$(echo $PACKAGE | cut -d# -f1)
ver1=$(echo $PACKAGE | cut -d# -f2)
ver2=$(echo $PACKAGE | cut -d# -f3)
ver3=$(echo $PACKAGE | cut -d# -f4)

echo "Available version:"
echo "pkgver=$ver1"
echo "pkgver2=$ver2"
echo "pkgver3=$ver3"

echo "Downloading updates..."

cur=$(pwd)
tmp=$(mktemp -d)
cd $tmp
wget -q "$REPO$deb"
md5=$(md5sum $deb | cut -d\  -f1)
rm $deb
cd $cur
rmdir $tmp

echo "Updating package..."

sed -i "s|^pkgver=.*$|pkgver=${ver1}|" PKGBUILD
sed -i "s|^pkgver2=.*$|pkgver2=${ver2}|" PKGBUILD
sed -i "s|^pkgver3=.*$|pkgver3=${ver3}|" PKGBUILD
sed -i "s|^md5sums.*$|md5sums=(\"${md5}\")|" PKGBUILD

makepkg --printsrcinfo > .SRCINFO

echo "Done."
