#!/usr/bin/env bash

set -e

pacman --noconfirm --refresh --sync base-devel sudo

useradd build

echo 'build ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/build

cd /build

su build -c 'makepkg --printsrcinfo > .SRCINFO'

su build -c 'makepkg --force'

pacman --noconfirm --upgrade *.pkg.tar.zst

macchina --version
