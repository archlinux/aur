#!/bin/bash

set -xeu

# test the new version
makepkg -f -i

# update .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# stage new files
git add PKGBUILD .SRCINFO
