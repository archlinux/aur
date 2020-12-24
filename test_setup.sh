#!/bin/bash
set -e
set -x

# Make sure system is up to date
pacman --noconfirm -Sy
pacman --noconfirm -S archlinux-keyring
pacman --noconfirm -Su
# Install compilers and stuff
pacman --noconfirm -S base-devel
pacman --noconfirm -S nano
# Add build user
useradd -U -G wheel -m user
# Permissions
chown user:user -R /netatop-dkms
sed -i 's|# %wheel ALL=(ALL) NOPASSWD: ALL|%wheel ALL=(ALL) NOPASSWD: ALL|g' /etc/sudoers
# Switch to build user
#su - user
