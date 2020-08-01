#!/usr/bin/env bash

rm -f ./*.xz
rm -f ./*.tar.gz
rm -f ./*.tar.zst
rm -f ./*.zip
rm -rf ./src
rm -rf ./pkg

# Update the reason-language-server's version in PKGBUILD

updpkgsums
makepkg --printsrcinfo > .SRCINFO

makepkg

namcap PKGBUILD
namcap ./*.tar.zst
