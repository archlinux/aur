#!/bin/bash

echo "Searching for updates..."
REPO='http://security.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/'
PACKAGE=$(wget -qO- $REPO | perl -ne '/(?<=href=")(chromium-codecs-ffmpeg-extra_(\d*\.\d*\.\d*\.\d*)-(\dubuntu\d).(\d{2}\.\d{2}(?:\.\d)?)_amd64.deb)(?=").*(?:\d{3}K|\d*\.\d*M)/ and print "$1#$2#$3#$4\n";' | sort --version-sort | tail -n 1)

deb=$(echo $PACKAGE | cut -d# -f1)
ver1=$(echo $PACKAGE | cut -d# -f2)
ver2=$(echo $PACKAGE | cut -d# -f3)
ver3=$(echo $PACKAGE | cut -d# -f4)

pkgver=$(grep "pkgver=" PKGBUILD | cut -d "=" -f 2-)
_ubuver=$(grep "_ubuver=" PKGBUILD | cut -d "=" -f 2-)
_ubudist=$(grep "_ubudist=" PKGBUILD | cut -d "=" -f 2-)

echo "Current version:   $pkgver-$_ubuver-$_ubudist"
echo "Available version: $ver1-$ver2-$ver3"

echo "Checking that the files exist..."
wget --quiet --spider $REPO/chromium-codecs-ffmpeg-extra_${pkgver}-${_ubuver}.${_ubudist}_amd64.deb
if [[ "$?" == "0" ]]; then echo "x86_64:  yes"; else echo "x86_64:   no"; fi
wget --quiet --spider $REPO/chromium-codecs-ffmpeg-extra_${pkgver}-${_ubuver}.${_ubudist}_i386.deb
if [[ "$?" == "0" ]]; then echo "i686:    yes"; else echo "i686:     no"; fi

REPO='http://ports.ubuntu.com/ubuntu-ports/pool/universe/c/chromium-browser/'

wget --quiet --spider $REPO/chromium-codecs-ffmpeg-extra_${pkgver}-${_ubuver}.${_ubudist}_armhf.deb
if [[ "$?" == "0" ]]; then echo "arm*:    yes"; else echo "arm*:     no"; fi
wget --quiet --spider $REPO/chromium-codecs-ffmpeg-extra_${pkgver}-${_ubuver}.${_ubudist}_arm64.deb
if [[ "$?" == "0" ]]; then echo "aarch64: yes"; else echo "aarch64:  no"; fi

echo "Updating PKGBUILD..."
sed -i "s|^pkgver=.*$|pkgver=${ver1}|" PKGBUILD
sed -i "s|^_ubuver=.*$|_ubuver=${ver2}|" PKGBUILD
sed -i "s|^_ubudist=.*$|_ubudist=${ver3}|" PKGBUILD

echo "Updating checksums..."
updpkgsums

echo "Generating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO
