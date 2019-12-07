#!/usr/bin/env bash

if [ ! -d ".git" ]
then
	echo "Not a git repository!"
	exit 1
fi

BUILD_FILE="PKGBUILD"
if [ ! -e "$BUILD_FILE" ]
then
	echo "Not an AUR repository!"
	exit 2
fi
source "$BUILD_FILE"

if [ "$1" == "--aur-only" ]
then
	echo "Only updating \$pkgrel!"
	sed -i "s|pkgrel\=.*|pkgrel\=$((pkgrel+1))|" "$BUILD_FILE"
else
	# Replace with latest release
	LATEST_VERSION=$(curl -L -s -H "Accept: application/json" "$url/releases/latest" | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
	if [ $(vercmp "$LATEST_VERSION" "$pkgver") -le 0 ]
	then
		echo "Already on latest release!"
		exit 3
	fi
	sed -i "s|pkgver\=.*|pkgver\=$LATEST_VERSION|" "$BUILD_FILE"
	sed -i "s|pkgrel\=.*|pkgrel\=1|" "$BUILD_FILE"

	# Update package checksum
	PKG_SHA=$(curl -L -s "$url/archive/$LATEST_VERSION.tar.gz" | sha256sum | cut -d " " -f 1)
	sed -i "s|sha256sums\=.*|sha256sums\=('$PKG_SHA')|" "$BUILD_FILE"
fi

makepkg --printsrcinfo > .SRCINFO
