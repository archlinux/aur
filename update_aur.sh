#!/usr/bin/env bash

# Change to the AUR repo
if [ -n "$1" ]; then
	cd "$1"
fi

if [ ! -d ".git" ]; then
	echo "Not a git repository!"
	exit 1
fi

BUILD_FILE="PKGBUILD"
if [ ! -e "$BUILD_FILE" ]; then
	echo "Not an AUR repository!"
	exit 2
fi
. "$BUILD_FILE"

LATEST_VERSION=$(curl -L -s -H "Accept: application/json" "$url/releases/latest" | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
if [ $(vercmp "$LATEST_VERSION" "$pkgver") -le 0 ]; then
	echo "Already on latest release!"
	exit 3
fi
sed -i "s%pkgver\=.*%pkgver\=$LATEST_VERSION%" "$BUILD_FILE"

PKG_SHA=$(curl -L -s "$url/archive/$LATEST_VERSION.tar.gz" | sha256sum | cut -d " " -f 1)
sed -i "s%sha256sums\=.*%sha256sums\=('$PKG_SHA')%" "$BUILD_FILE"

makepkg --printsrcinfo > .SRCINFO
