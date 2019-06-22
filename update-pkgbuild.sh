#!/usr/bin/env bash
set -e

RELEASE=$(curl 'https://api.github.com/repos/erpalma/throttled/releases' | jq -r '.[0].tag_name' | sed 's/v//g')

sed -i "/pkgver=/c\pkgver=${RELEASE}" PKGBUILD

updpkgsums
makepkg -s
makepkg --printsrcinfo > .SRCINFO
git add . || true
git commit -m "Update to v${RELEASE}" || true
