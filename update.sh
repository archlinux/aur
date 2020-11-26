#!/bin/sh

set -euo pipefail
cd "$(dirname "$0")"

if [ -n "$(git status --porcelain)" ]; then
	echo "Working directory is not clean"
	exit 1
fi
git pull

CHROMIUM_VERSION=$(curl -sSf "https://omahaproxy.appspot.com/linux")
V8_VERSION=$(curl -sSf "https://omahaproxy.appspot.com/v8.json?version=$CHROMIUM_VERSION" | jq -r ".v8_version")
sed -e "s/^pkgver=.*/pkgver=$V8_VERSION/" -i PKGBUILD
if [ -z "$(git status --porcelain)" ]; then
	echo "Nothing to do"
	exit 1
fi
sed -e "s/^pkgrel=.*/pkgrel=1/" -i PKGBUILD

echo "Updating to $V8_VERSION..."
updpkgsums
makepkg --printsrcinfo > .SRCINFO
git commit -am "Update to $V8_VERSION"
git push
