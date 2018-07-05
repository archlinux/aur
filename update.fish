#!/usr/bin/env fish

set version $argv[1]
set hash (string sub -l 64 (curl -L https://github.com/r-darwish/topgrade/archive/v$version.tar.gz ^/dev/null | sha256sum))

sed -E "s/sha256sums=.*\$/sha256sums=\('$hash'\)/g" -i PKGBUILD
sed -E "s/pkgver=.*\$/pkgver=$version/g" -i PKGBUILD
makepkg --printsrcinfo > .SRCINFO
makepkg
