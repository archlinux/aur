#!/bin/bash

updpkgsums

CHROOT=$HOME/.local/share/chroot
if [[ ! -d "$CHROOT" ]]; then
    mkdir -p ~/.local/share/chroot
    sudo pacman -Syy
    mkarchroot $HOME/.local/share/chroot/root base-devel
    arch-nspawn $HOME/.local/share/chroot/root pacman -Syyu
fi

makechrootpkg -c -r $CHROOT -- -Acsf .
makepkg --printsrcinfo >.SRCINFO
