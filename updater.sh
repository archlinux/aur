#!/bin/sh

set -e

echo "Getting latest version information"
resp=$(curl -s https://packages.cloud.google.com/apt/dists/endpoint-verification/main/binary-amd64/Packages)

filename=$(grep Filename <<< $resp | cut -d' ' -f2)
version=$(grep Version <<< $resp | cut -d' ' -f2)
sha256sum=$(grep SHA256 <<< $resp | cut -d' ' -f2)

pkgversion=$(grep '_pkgver=' PKGBUILD | cut -d= -f2)

if [ $version = $pkgversion ]; then
	echo "Current version $version up to date"
	exit
else
	echo "Update found: $version"
fi

echo "Patching PKGBUILD"
sed -i.bak \
	-e "s/^sha256sums=.*$/sha256sums=(\"$sha256sum\")/" \
	-e "s/^_pkgver=.*$/_pkgver=$version/" \
	-e "s/^pkgver=.*$/pkgver=${version//-/_}/" \
	-e "s/^pkgrel=.*$/pkgrel=1/" \
	PKGBUILD

echo "Install now with makepkg -si"

