#!/bin/bash

# This script updates the package version if a new version is available

set -euxo pipefail

# Get channel
CHANNEL=$(awk -F '=' '/^_channel/{ print $2 }' PKGBUILD)
PKG="microsoft-edge-${CHANNEL}"

# Get latest version
VER=$(curl -sSf https://packages.microsoft.com/repos/edge/dists/stable/main/binary-amd64/Packages |
grep -A6 "Package: ${PKG}" |
     awk '/Version/{print $2}' |
     cut -d '-' -f1 |
     sort -V -r |
     head -n1)	

# Insert latest version into PKGBUILD and update hashes
sed -i \
    -e "s/^pkgver=.*/pkgver=${VER}/" \
    PKGBUILD

# Check whether this changed anything
if (git diff --exit-code PKGBUILD); then
    echo "Package ${PKG} has most recent version ${VER}"
    exit 0
fi

# updpkgsums
SUM256=$(curl -sSf https://packages.microsoft.com/repos/edge/dists/stable/main/binary-amd64/Packages |
    grep -A15 "Package: ${PKG}" |
    awk '/SHA256/{print $2}' |
    head -n1)

# Insert latest shasum into PKGBUILD and update hashes
SUM256=$(curl -sSf https://packages.microsoft.com/repos/edge/dists/stable/main/binary-amd64/Packages |
     grep -A15 "Package: ${PKG}" |
     awk '/SHA256/{print $2}' |
    sort -V -r |
    head -n1)
    

# Reset pkgrel
sed -i \
    -e 's/pkgrel=.*/pkgrel=1/' \
    PKGBUILD

# Update .SRCINFO
makepkg --printsrcinfo >.SRCINFO

# Start generate package
makepkg -Acsf .

# Commit changes
git add PKGBUILD .SRCINFO
git commit -m "Update ${PKG} to v${VER}"
