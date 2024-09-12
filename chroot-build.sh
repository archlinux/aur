#!/bin/bash

set -euxo pipefail

# Preparing arch-chroot
CHROOT=$HOME/.local/share/chroot
if [[ ! -d "$CHROOT/root" ]]; then
    mkdir -p "$CHROOT"
    mkarchroot -M /etc/makepkg.conf "$CHROOT/root" base-devel
fi

arch-nspawn "$CHROOT/root" pacman -Syu
makechrootpkg -c -r "$CHROOT" -- -Acsf .

# Update .SRCINFO
makepkg --printsrcinfo >.SRCINFO

rm -rf -- */ *.log *.gz
#sudo btrfs subvolume delete "$CHROOT/root"

PACKAGE="$(makepkg --packagelist)"
gpg --use-agent --output "$PACKAGE.sig" --detach-sign "$PACKAGE"
