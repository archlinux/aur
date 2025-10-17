#!/bin/bash
# SPDX-FileCopyrightText = "Arch Linux contributors"
# SPDX-License-Identifier = "0BSD"

# Variables
PKGBUILD_PATH="/home/dillan/Developer/ollama-grid-search/PKGBUILD"
SRCINFO_PATH="/home/dillan/Developer/ollama-grid-search/.SRCINFO"
REPO="dezoito/ollama-grid-search"

# Get the latest release tag from GitHub
LATEST_RELEASE=$(curl -s https://api.github.com/repos/$REPO/releases/latest | grep tag_name | cut -d '"' -f 4)
_LATEST_RELEASE=${LATEST_RELEASE#v}

# Download the latest deb
DEB_NAME="ollama-grid-search_${_LATEST_RELEASE}_amd64.deb"
curl -L -o $DEB_NAME https://github.com/$REPO/releases/download/$LATEST_RELEASE/$DEB_NAME

# Calculate the sha256sum
SHA256SUM=$(sha256sum $DEB_NAME | awk '{ print $1 }')

# Update the PKGBUILD file
sed -i "s/pkgver=.*/pkgver=$LATEST_RELEASE/" $PKGBUILD_PATH
sed -i "s/pkgrel=.*/pkgrel=1/" $PKGBUILD_PATH
sed -i "s/sha256sums_amd64=('.*')/sha256sums_amd64=('$SHA256SUM')/" $PKGBUILD_PATH

# Update the .SRCINFO file
sed -i "s/pkgver = .*/pkgver = $LATEST_RELEASE/" $SRCINFO_PATH
sed -i "s/pkgrel = .*/pkgrel = 1/" $SRCINFO_PATH
sed -i "s/\(.*search_\).*?\(_.*\)/(\1$LATEST_RELEASE\2)/" $SRCINFO_PATH
sed -i "s|\(.*download\)/v.*/\(.*\)|\1/v$LATEST_RELEASE/\2|" $SRCINFO_PATH
sed -i "s/sha256sums_amd64 = ('.*')/sha256sums_amd64 = $SHA256SUM/" $SRCINFO_PATH

rm $APPIMAGE_NAME

echo "PKGBUILD updated with the latest release: $LATEST_RELEASE"
