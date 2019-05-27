#!/usr/bin/env fish

set -l package_version $argv[1]
set -l hash (string sub -l 64 (curl -L https://github.com/r-darwish/alma/archive/v$package_version.tar.gz | sha256sum))

sed -E "s/sha256sums=.*\$/sha256sums=\('$hash'\)/g" -i PKGBUILD
sed -E "s/pkgver=.*\$/pkgver=$package_version/g" -i PKGBUILD
makepkg --printsrcinfo > .SRCINFO
makepkg
