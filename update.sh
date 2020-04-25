#!/bin/bash
set -e
makepkg -sc
rm -rf src *.pkg.* KittehPlayer
makepkg --printsrcinfo > .SRCINFO
git add . && git commit -m "Update" && git push
