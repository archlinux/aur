#!/usr/bin/env bash
v=$(curl -s https://github.com/lenny-ts/caddy-analyzer/releases.atom | grep title | head -2 | tail -1 | sed "s/.*<title>v//;s/<.*//")
sed -i "s/pkgver=.*/pkgver=$v/" PKGBUILD
wget https://github.com/lenny-ts/caddy-analyzer/archive/refs/tags/v${v}.tar.gz -O caddy-analyzer-${v}.tar.gz
s=$(sha512sum caddy-analyzer-${v}.tar.gz | sed "s/ .*//")
sed -i "s/sha512sums=.*/sha512sums=( \"${s}\" )/" PKGBUILD
makepkg --printsrcinfo >.SRCINFO
makepkg -s && git commit -am "version bump: ${v}" && git push
