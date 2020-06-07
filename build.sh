#!/bin/bash
set -e
set -x
makepkg --force
namcap PKGBUILD
namcap wezterm*.pkg.tar.xz
