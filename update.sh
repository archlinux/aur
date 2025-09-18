#!/bin/bash
set -euo pipefail

# URL to fetch the new version number from
version_url="https://raw.githubusercontent.com/GhelloZ/edh-logger-cli/refs/heads/releases/metadata/VERSION"

# Fetch the new version
new_ver=$(curl -s "$version_url" | tr -d '[:space:]')
if [[ -z "$new_ver" ]]; then
	echo "Error: could not fetch version from $version_url"
	exit 1
fi

# Extract current pkgver and pkgrel from PKGBUILD
current_ver=$(grep -E '^pkgver=' PKGBUILD | cut -d= -f2)
current_rel=$(grep -E '^pkgrel=' PKGBUILD | cut -d= -f2)

if [[ "$new_ver" == "$current_ver" ]]; then
	# Version didn't change
	# Bump pkgrel
	new_rel=$((current_rel + 1))
	sed -i "s/^pkgrel=.*/pkgrel=${new_rel}/" PKGBUILD

	echo "pkgver unchanged (${new_ver}), bumped pkgrel to ${new_rel}"
else
	# Version changed
	# Update pkgver
	sed -i "s/^pkgver=.*/pkgver=${new_ver}/" PKGBUILD
	# Reset pkgrel
	sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

	# Update sha256sums
	new_sum=$(makepkg -g | grep sha256sums)
	if [[ -z "$new_sum" ]]; then
		echo "Error: could not generate sha256sums."
		exit 1
	fi
	sed -i "s/^sha256sums=.*/${new_sum}/" PKGBUILD

	echo "Updated pkgver to ${new_ver}, reset pkgrel to 1, updated sha256sums"
fi

makepkg --printsrcinfo > .SRCINFO

git commit -a -m 'Updated PKGBUILD'
git push

rm -rf src
