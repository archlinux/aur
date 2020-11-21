#!/bin/sh

set -euo pipefail
cd "$(dirname "$0")"

if [ -n "$(git status --porcelain)" ]; then
	echo "Working directory is not clean"
	exit 1
fi

git pull

read -r -d "\n" TAG_NAME RELEASE_NAME <<< "$(curl -sSf "https://api.github.com/repos/ruffle-rs/ruffle/releases?per_page=1" | jq -r ".[0] | .tag_name, .name")" || true

sed -e "s/^pkgver=.*/pkgver=${TAG_NAME//-/.}/" \
	-e "s/^pkgrel=.*/pkgrel=1/" \
	-i PKGBUILD

if [ -z "$(git status --porcelain)" ]; then
	echo "Nothing to do"
	exit 1
fi

echo "Updating to $RELEASE_NAME..."
updpkgsums
makepkg --printsrcinfo > .SRCINFO
git commit -am "Update to $RELEASE_NAME"
git push
