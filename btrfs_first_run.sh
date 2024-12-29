#!/bin/sh
if [[ "$USER" == "root" ]]; then
pacman -Syyuu --noconfirm grub-btrfs inotify-tools snapper
systemctl enable grub-btrfsd.service
snapper -c root create-config /
chmod 750 /.snapshots
chown :wheel /.snapshots
rm first_run.sh
fi
