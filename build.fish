#!/bin/fish
set pkgver (echo $argv[1] | tr -d v)
set pkgrel (echo $pkgver | tr -d '.')
curl "https://github.com/kagg886/Pixiv-MultiPlatform/releases/download/v$pkgver/linux.tar.gz" -O
set sha (sha256sum linux.tar.gz | cut -d ' ' -f 1)

echo "pkgver=$pkgver
pkgrel=$pkgrel
sha256sums=(
    $sha" >PKGBUILD
cat PKGBUILD.part1 >>PKGBUILD
makepkg --printsrcinfo >.SRCINFO
git commit -a -m v$pkgver
