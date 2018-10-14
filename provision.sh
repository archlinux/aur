#!/bin/bash
sudo pacman -Syu --needed --noconfirm \
    base-devel wget curl sudo git tar yajl 

for thing in package-query yaourt; do
    git clone https://aur.archlinux.org/${thing}.git
    cd ${thing}/
    makepkg -si --noconfirm
    cd ..
    rm -rf ${thing}
done

yaourt -Syu --aur glitchlock --noconfirm

which glitchlock
glitchlock --version
