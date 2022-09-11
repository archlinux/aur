#!/bin/bash

makepkg -sirc
makepkg --printsrcinfo > .SRCINFO
git clean -dfX
git add .SRCINFO PKGBUILD
git commit
