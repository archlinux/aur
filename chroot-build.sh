#!/bin/bash

# This script updates the package version if a new version is available
set -euxo pipefail

# Pull latest changes
git pull

# Get latest version
VER=$(curl -sSf https://api.github.com/repos/SUPERCILEX/gnome-clipboard-history/releases/latest |
    grep -Po '(?<="tag_name": ")[^"]*')

# Insert latest version into PKGBUILD and update hashes
sed -i \
    -e "s/^pkgver=.*/pkgver=${VER}/" \
    PKGBUILD

# Check whether this changed anything
if (git diff --exit-code PKGBUILD); then
    echo "Package has most recent version ${VER}"
    exit 0
fi

# updpkgsums
SUM256=$(curl -sL "https://github.com/SUPERCILEX/gnome-clipboard-history/archive/refs/tags/${VER}.tar.gz"  | shasum -a 256 | cut -d " " -f 1)

# Insert latest shasum into PKGBUILD and update hashes
sed -i \
    -e "s/^sha256sums=('.*/sha256sums=('${SUM256}')/" \
    PKGBUILD

# Reset pkgrel
sed -i \
    -e 's/pkgrel=.*/pkgrel=1/' \
    PKGBUILD

# Preparing arch-chroot
CHROOT=$HOME/.local/share/chroot
if [[ ! -d "$CHROOT" ]]; then
    mkdir -p ~/.local/share/chroot
    mkarchroot $HOME/.local/share/chroot/root base-devel
    arch-nspawn $HOME/.local/share/chroot/root pacman -Syu
fi

# Start generate package
makechrootpkg -c -r $CHROOT -- -Acsf .

# Update .SRCINFO
makepkg --printsrcinfo >.SRCINFO

# Commit changes
git add PKGBUILD .SRCINFO
git commit -s -m "Update to ${VER}"
rm -rf *.gz *.log *.zst
