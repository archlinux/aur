#!/usr/bin/env bash

# Automate updating to a new version. Just set the new version
# in PKGBUILD and this script will take care of the rest.

set -e

source ./PKGBUILD

source_url=$(echo $source | sed -E 's/.+::(.+)/\1/g')
echo "Source URL: $source_url"

sum_256=$(curl -sL "$source_url" | sha256sum | cut -d" " -f1)
echo "Sha256Sum: $sum_256"

sed -E -i "s/sha256sums=(.+)/sha256sums=('$sum_256')/g" PKGBUILD
makepkg --printsrcinfo > .SRCINFO
echo "Updated PKGBUILD and .SRCINFO successfully."
