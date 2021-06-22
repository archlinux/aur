#!/usr/bin/env bash
# This script goal is to bump an AUR package to the given version
set -eo pipefail

# Remove 'v' character from version string and validate input
VERSION=${1/v/}
validVersion='^[0-9]+\.[0-9]+\.[0-9]+$'
if [[ ! $VERSION =~ $validVersion ]]; then
    echo "Invalid version argument: '$1'" >&2
    exit 1
fi

echo "Updating AUR pkg to v${VERSION}"

# Retrieve checksum from checksum file generated in build step
SUM386=$(awk '/^.+ driftctl_linux_386/{print $1}' driftctl_SHA256SUMS)
SUMAMD64=$(awk '/^.+ driftctl_linux_amd64/{print $1}' driftctl_SHA256SUMS)

# Update package version and checksums
sed -i "s/pkgver=.*\$/pkgver=${VERSION}/g" PKGBUILD
sed -i "s/sha256sums_x86_64=.*\$/sha256sums_x86_64=('${SUMAMD64}')/g" PKGBUILD
sed -i "s/sha256sums_i686=.*\$/sha256sums_i686=('${SUM386}')/g" PKGBUILD

# DISCLAIMER: You may find a lot of frustration and ugly things below, sorry for you Arch guys but the way AUR publication process
# is designed make it very complicated to automate a simple version bump in a CI/CI flow.
# This is a way too complicated to use makepkg :
# - the latest docker image is broken
#   - https://stackoverflow.com/q/66154574/2260742
#   - https://serverfault.com/q/1052963/279641
#   - https://bugs.archlinux.org/index.php?do=details&task_id=69563
# - there is no reproducible docker images based on Arch archive, so impossible to be sure that things will never break
#   as arch is a rolling release
# Thus bumping a pkg version outside an arch installation is nearly impossible by using official tool today ...
# Feel free to find a better way to do this, we already spent too much time on it.

# Change package version
sed -i "s/pkgver = .*\$/pkgver = ${VERSION}/g" .SRCINFO

# Replace the version string in source fields
sed -i "s/\/v[0-9]\+\.[0-9]\+\.[0-9]\+\//\/v${VERSION}\//g" .SRCINFO
sed -i "s/driftctl-[0-9]\+\.[0-9]\+\.[0-9]\+/driftctl-${VERSION}/g" .SRCINFO

# Replace binaries checksums
sed -i "s/sha256sums_x86_64 = .*\$/sha256sums_x86_64 = ${SUMAMD64}/g" .SRCINFO
sed -i "s/sha256sums_i686 = .*\$/sha256sums_i686 = ${SUM386}/g" .SRCINFO
