#!/usr/bin/env bash

echo "Syncing grub themes to /boot ..."
rsync \
  --archive \
  --delete \
  --exclude-from <(pacman -Qlq | grep '/boot/grub' | cut -d '/' -f4- | tail -n+3) \
  /usr/share/grub/themes \
  /boot/grub/
