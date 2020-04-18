#!/usr/bin/env bash

rm -f ./*.xz
rm -f ./*.zip

# Update the reason-language-server's version in PKGINFO

updpkgsums
makepkg --printsrcinfo > .SRCINFO

makepkg

namcap PKGBUILD
namcap ./*.xz
