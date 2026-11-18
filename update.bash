#!/bin/bash

VERSION=$(curl -s https://github.com/MalpenZibo/ashell/releases.json | jq -r '.payload.releasesIndexRoute.toc[0].label')

echo $VERSION

sed -i "s/pkgrel=.*/pkgrel=1/" PKGBUILD
sed -i "s/pkgver=.*/pkgver=$VERSION/" PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
git add -p
git commit -m "v$VERSION"
