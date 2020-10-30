#!/bin/sh

set -euo pipefail

cd "$(dirname "$0")"

CHROMIUM_VERSION=$(curl -sSf "https://omahaproxy.appspot.com/linux")
V8_VERSION=$(curl -sSf "https://omahaproxy.appspot.com/v8.json?version=$CHROMIUM_VERSION" | jq -r '.v8_version')

sed -e "s/^pkgver=.*/pkgver=$V8_VERSION/" \
    -e 's/pkgrel=.*/pkgrel=1/' \
    -i PKGBUILD
if (git diff --quiet PKGBUILD); then
	echo "Nothing to do"
	exit
fi

echo "Updating to $V8_VERSION..."
makepkg --printsrcinfo > .SRCINFO
git restore --staged .
git add PKGBUILD .SRCINFO
git commit -m "Update to $V8_VERSION"
