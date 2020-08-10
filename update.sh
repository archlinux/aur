#!/usr/bin/env bash

rm -f ./*.xz
rm -f ./*.tar.gz
rm -f ./*.tar.zst
rm -f ./*.zip
rm -rf ./src
rm -rf ./pkg

# Update the N's version in PKGINFO

updpkgsums
makepkg --printsrcinfo > .SRCINFO

makepkg

namcap PKGBUILD
namcap ./*.tar.zst
