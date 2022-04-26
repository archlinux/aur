#!/usr/bin/env bash

set -e

pacman -Sy --noconfirm
pacman -S git --noconfirm
echo 'yay ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
useradd -d /home/yay -g users -m -s /bin/bash yay
cd /tmp
sudo -u yay git clone https://aur.archlinux.org/yay-bin.git
cd /tmp/yay-bin
sudo -u yay makepkg -si --noconfirm
sudo -u yay yay -S --noconfirm ferdium-bin
cp /home/yay/.cache/yay/ferdium-bin/ferdium-bin-*.pkg.tar.zst /tmp/output
