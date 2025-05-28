#!/bin/bash

# Define the package name
pkgname="node-hp-scan-to"

# Get the latest version from the npm registry
VERSION=$(npm view "$pkgname" version)

# Update pkgver in PKGBUILD
sed -i "s/^pkgver=.*/pkgver=${VERSION}/" PKGBUILD

# Define the source URL
SOURCE_URL="https://registry.npmjs.org/${pkgname}/-/${pkgname}-${VERSION}.tgz"

# Download the new source file
curl -L -o "${pkgname}-${VERSION}.tgz" "$SOURCE_URL"

# Calculate the new SHA512 checksum
NEW_SHA512SUM=$(sha512sum "${pkgname}-${VERSION}.tgz" | awk '{ print $1 }')

# Update sha512sums in PKGBUILD
sed -i "s/^sha512sums=(.*)$/sha512sums=(${NEW_SHA512SUM})/" PKGBUILD

# Clean up the downloaded file
rm "${pkgname}-${VERSION}.tgz"
