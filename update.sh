#!/usr/bin/env bash

set -e

UPSTREAM=${UPSTREAM:-newrelic/infrastructure-agent}
echo "Using ${UPSTREAM} as upstream repo"

if [[ -z $VERSION ]]; then
	VERSION=$(curl -s https://api.github.com/repos/newrelic/infrastructure-agent/releases/latest | jq -r .tag_name)
fi

echo "Updating PKGBUILD to ${VERSION}"
sed -i "s/pkgver=.*/pkgver=${VERSION}/" PKGBUILD

echo "Updating checksums..."
updpkgsums

echo "Checking build..."
makepkg -s

echo "Updating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "Successfully updated PKGBUILD to $VERSION"
