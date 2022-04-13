#!/bin/env bash

set -e

export VERSION=$1
export PKGREL=${2:-1}

envsubst '$VERSION $PKGREL' < PKGBUILD.tpl > PKGBUILD

makepkg --geninteg >> PKGBUILD
makepkg --printsrcinfo > .SRCINFO

#git add -A
#git commit -m "Updated to v${VERSION}"
#git push
