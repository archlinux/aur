#!/bin/bash
# Regenerate .SRCINFO from PKGBUILD
set -e
cd "$(dirname "$0")"
makepkg --printsrcinfo > .SRCINFO
echo ".SRCINFO updated."
