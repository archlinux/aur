#!/bin/sh
git add *.sh .SRCINFO PKGBUILD
git commit -m "$(date)"
git push

