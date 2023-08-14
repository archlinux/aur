#!/usr/bin/env sh

cp /boot/grub/grub.cfg "/boot/grub/grub.cfg.bak-$(date "+%F_%H-%M-%S")"
grub-mkconfig -o /boot/grub/grub.cfg
