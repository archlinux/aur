#!/bin/bash
namcap PKGBUILD
makepkg -f
makepkg --printsrcinfo > .SRCINFO
