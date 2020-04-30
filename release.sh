#!/bin/bash
set -euo pipefail

VERSION=$1

echo "Making a new release of stripe-cli $VERSION"

echo "Getting checksum..."
CHECKSUM=$(curl -L https://github.com/stripe/stripe-cli/releases/download/v${VERSION}/stripe-checksums.txt | grep linux_x86_64.tar.gz | awk '{print $1}')

echo "Building PKGBUILD..."
sed "s/VERSION/$VERSION/g;s/CHECKSUM/$CHECKSUM/g" PKGBUILD.template > PKGBUILD

echo "Making and installing package locally..."
makepkg -i

echo "Generating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "Committing to git..."
git commit -am "Release of $VERSION"

echo "Test that the new version works with stripe -v, then push"
