#!/bin/sh
rm *zst
rm *log
rm *gz
cp ../../archwikisearch/PKGBUILD .
namcap PKGBUILD
makepkg
namcap arch-wiki-search-*.tar.zst
makepkg --printsrcinfo > .SRCINFO

