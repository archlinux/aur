#!/bin/sh

post_install() {
	echo " > Now add 'chkeymap' to your HOOKS array in /etc/mkinitcpio.conf"
	echo " > and rebuild initial ramdisk."
	echo " > Add keymap= and/or timezone= to your kernel command line to set"
	echo " > in main system."
}

post_remove() {
	sed -i "/^HOOKS=/s/chkeymap//" /etc/mkinitcpio.conf
}
