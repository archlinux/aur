#!/bin/bash

# This script updates the package version if a new version is available
set -euxo pipefail

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
#makepkg --printsrcinfo >.SRCINFO

# Commit changes
#git add PKGBUILD .SRCINFO
#git commit -s -m "Update to ${VER}"
#rm -rf *.gz *.log *.zst
sudo rm -Rf "$CHROOT"
