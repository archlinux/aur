#!/usr/bin/env sh

cp /boot/grub/grub.cfg /boot/grub/grub.cfg.bak
grub-mkconfig -o /boot/grub/grub.cfg
