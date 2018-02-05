#!/bin/bash

if [[ ! $# -eq "2" ]] || [[ $1 -lt $2 ]]; then
	echo "Usage:"
	echo "$0 version omege_version"
	exit 1
fi

rm -v TerasologyOmega*.zip{,.part}
rm -rv src/

echo "Setting version to $1"
sed -i "s/pkgver=.*/pkgver=$1/g" PKGBUILD

echo "Setting Omega version to $2"
sed -i "s/_omega_ver=.*/_omega_ver=$2/g" PKGBUILD

echo updpkgsums
updpkgsums
chmod -v 644 PKGBUILD
makepkg
makepkg --printsrcinfo > .SRCINFO

rm sha256sums.txt
wget "https://jenkins.terasology.org/job/DistroOmega/$2/artifact/distros/omega/build/distributions/sha256sums.txt"
sed -i "s/TerasologyOmega/TerasologyOmega$2/g" sha256sums.txt
sha256sum -c sha256sums.txt
