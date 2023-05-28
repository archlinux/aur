#!/bin/sh

set -e

# Download Package Database
pacman -Sy --noconfirm

# Create User
useradd builduser -m
passwd -d builduser
echo 'builduser ALL=(ALL) ALL' >> /etc/sudoers

# Create Build Directory
mkdir /home/builduser/build
cp PKGBUILD /home/builduser/build
chown builduser -R /home/builduser/build

# Regenerate .SRCINFO
sudo -u builduser bash -c 'makepkg --printsrcinfo' > .SRCINFO

# Build
sudo -u builduser bash -c 'cd ~/build && makepkg -si --noconfirm'
