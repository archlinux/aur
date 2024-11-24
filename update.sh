#!/bin/bash

usage() {
	echo "${0} \<version\>"
}

# Update PKGBUILD with information from a new release.
if [[ -z ${1} ]]; then
	echo "No version specified."
	usage
	exit 1
fi
VERSION="${1}"

# Source PKGBUILD to get access to variables.
. PKGBUILD

echo "Fetch checksums."
CHECKSUMS=()
for src in ${source[@]}; do
	# Fetch checksum.
	SHA512SUM=$(curl -s --output - ${src##*::} | sha512sum | cut -d" " -f1)
	echo "${SHA512SUM} - ${src##*::}"
	CHECKSUMS+=("${SHA512SUM}")
done

echo "Inserting checksum."
sed -i -e "s/^sha512sums=.*$/sha512sums=(${CHECKSUMS[@]})/" PKGBUILD

echo "Inserting package version '${VERSION}'."
sed -i -e "s/^pkgver=.*$/pkgver=${VERSION}/" PKGBUILD

echo "Updating .SRCINFO."
makepkg --printsrcinfo > .SRCINFO
