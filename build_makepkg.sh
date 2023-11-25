#!/usr/bin/bash

namcap PKGBUILD
makepkg --syncdeps --rmdeps --clean --cleanbuild --log
makepkg --printsrcinfo > .SRCINFO
