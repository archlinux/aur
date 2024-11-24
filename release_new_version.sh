#!/usr/bin/env bash
set -euo pipefail
shopt -s extglob nullglob
IFS=$'\n\t'

CURRENT_VERSION="$(grep pkgver= PKGBUILD | sed 's/^pkgver=//')"
LATEST_VERSION="$(gh release list -R "deponian/logalize" -L 1 --json "tagName" --jq ".[0].tagName" | sed 's/^v//')"

if [[ "${CURRENT_VERSION}" == "${LATEST_VERSION}" ]]; then
	echo "Current version is: ${CURRENT_VERSION}"
	echo "Latest version is: ${LATEST_VERSION}"
	echo "Nothing to release."
	exit 1
else
	echo "A new version has been found: ${LATEST_VERSION}"
fi

sed -i -e "s/pkgver=.*/pkgver=${LATEST_VERSION}/" PKGBUILD

updpkgsums

makepkg --printsrcinfo > .SRCINFO
