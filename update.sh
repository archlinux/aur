#!/usr/bin/env bash

rm -f ./*.xz

makepkg --printsrcinfo > .SRCINFO
updpkgsums

makepkg

namcap PKGBUILD
namcap ./*.xz
