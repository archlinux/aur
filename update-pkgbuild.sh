#!/usr/bin/env bash
# run this to update pkgver to latest git and consequently produce a new
# .SRCINFO
set -eo pipefail
set -x

: run makepkg without building to update embedded pkgver variable
makepkg --nobuild
: regenerate .SRCINFO
makepkg --printsrcinfo > .SRCINFO
