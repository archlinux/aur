#!/bin/bash

echo 'Searching for updates...'
REPO='http://ports.ubuntu.com/ubuntu-ports/pool/universe/c/chromium-browser/'
PACKAGE=$(wget -qO- $REPO | perl -ne '/(?<=href=")(chromium-codecs-ffmpeg-extra_(\d+\.\d+\.\d+\.\d+)-(\d+ubuntu\d+)\.(\d+\.\d+(\.\d+)?)_arm64\.deb)(?=")/ and print "$1#$2#$3#$4\n";' | sort --version-sort | tail -n 1)

deb=$(echo $PACKAGE | cut -d# -f1)
ver1=$(echo $PACKAGE | cut -d# -f2)
ver2=$(echo $PACKAGE | cut -d# -f3)
ver3=$(echo $PACKAGE | cut -d# -f4)

pkgver=$(grep "pkgver=" PKGBUILD | cut -d "=" -f 2-)
_ubuver=$(grep "_ubuver=" PKGBUILD | cut -d "=" -f 2-)
_ubudist=$(grep "_ubudist=" PKGBUILD | cut -d "=" -f 2-)

echo "Current version:   $pkgver-$_ubuver-$_ubudist"
echo "Available version: $ver1-$ver2-$ver3"

if [[ "$pkgver" == "$ver1" ]]; then
	echo 'Nothing to do.'
	exit 0
fi

echo 'Updating PKGBUILD...'
sed -i "s|^pkgver=.*$|pkgver=${ver1}|" PKGBUILD
sed -i "s|^_ubuver=.*$|_ubuver=${ver2}|" PKGBUILD
sed -i "s|^_ubudist=.*$|_ubudist=${ver3}|" PKGBUILD

echo "Updating checksums..."
updpkgsums
rm -f chromium-codecs-ffmpeg-extra_*

echo 'Generating .SRCINFO...'
makepkg --printsrcinfo > .SRCINFO
