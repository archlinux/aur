# THE BACKGROUND:

Linode (http://www.linode.com) is a VPS host which supports Arch Linux servers and custom kernels. This project gives you an Arch kernel for your Linode.

# THE PROBLEM:

Linode does not distribute their kernel configs - you have to boot into one and read /proc/config.gz. Arch's vanilla x86_64 will boot, but is full of drivers you will never ever use on a Linode. Arch's i686 will not work at all.

# THE SOLUTION:

This package provides a working, semi-minimalist kernel. It boots and is fine to run as-is for most things. (I do!) It can also be your starting point for tweaking.

Configs are a compromise between vanilla Linode and Arch. Most drivers are disabled, while a lot of ciphers and net stuff are inline. Few actual modules are left. This is not to everyone's taste, so hack away.

# GRUB MENU INCLUDED

Includes a grub boot menu where Linode expects to find it. You do NOT need grub, grub2, grub-legacy or any other. grub-legacy is a conflict because of menu.lst.

Steps to use:

	1) pacman -Syu
	2) pacman -U $pkgfile
	3) reboot your Linode with a pv-grub kernel
	4) report bugs ;)
