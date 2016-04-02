#!/bin/bash

mksrcinfo &&
git add PKGBUILD .SRCINFO update.sh &&
git commit -m 'Update $(git rev-parse --short HEAD)' &&
git push origin master
