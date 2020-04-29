#!/bin/bash

# This script reads the CI config from xdg-desktop-portal-wlr's git repo
# and updates depends/makedepends accordingly in the PKGBUILD.
# It updates the PKGBUILD in place.

# The script must be run from the PKGBUILD directory and it assumes that
# the sources are located in ./src/xdg-desktop-portal-wlr-git

yml="$(cat src/xdg-desktop-portal-wlr-git/.builds/archlinux.yml | sed 's/ *- //g')"

# Dumb-parse yaml file and get the "packages" section
pkgs="${yml##*packages:}"
pkgs="${pkgs%%sources*}"

depends="wlroots xdg-desktop-portal"
makedepends="git"

function move_to_makedepends() {
  local pkg="$1"
  pkgs="${pkgs//$pkg}"
  makedepends="$makedepends $pkg"
}

# Remove the compilers since they're in base-devel
pkgs="${pkgs//gcc}"
pkgs="${pkgs//clang}"

# Try to filter out makedepends and treat them as such
echo "$pkgs" | grep -q meson             && move_to_makedepends meson
echo "$pkgs" | grep -q wayland-protocols && move_to_makedepends wayland-protocols
echo "$pkgs" | grep -q wayland           && move_to_makedepends wayland
echo "$pkgs" | grep -q systemd-libs      && move_to_makedepends systemd-libs

# Strip out empty lines
pkgs="$(echo "$pkgs" | sed '/^$/d')"

# Add the rest to depends
depends="$depends $(echo "$pkgs" | tr '\n' ' ')"

# Trim away extra spaces
depends="$(echo "$depends" | xargs)"
makedepends="$(echo "$makedepends" | xargs)"

echo "=> Updated dependencies from CI config:"
echo "depends=($depends)"
echo "makedepends=($makedepends)"

sed -i \
  -e s/'^depends=.*$'/"depends=($depends)"/ \
  -e s/'^makedepends=.*$'/"makedepends=($makedepends)"/ \
  PKGBUILD


