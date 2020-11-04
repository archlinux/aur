#!/usr/bin/env bash

set -euo pipefail

tarball=$(curl https://pkgs.tailscale.com/stable/ 2>/dev/null | grep amd64.tgz | cut -f2 -d'"')
version=$(echo $tarball | cut -f2 -d'_')

sed -i -e "s/^pkgver=.*/pkgver=\"$version\"/" -e "s/^_version=.*/_version=\"$version\"/" PKGBUILD

conf=/etc/makepkg.conf
if [ ! -f "$conf" ]; then
    # makepkg.conf location in Nix package.
    conf="$(dirname `which makepkg`)/../etc/makepkg.conf"
fi
makepkg --config="$conf" --printsrcinfo >.SRCINFO
git commit -a -m "Update to version $version"
