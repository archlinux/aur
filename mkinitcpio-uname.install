#!/bin/sh

post_install() {
	echo " > Now add 'uname' to your HOOKS array in /etc/mkinitcpio.conf"
	echo " > and rebuild initial ramdisk."
}

post_remove() {
	sed -i "/^HOOKS=/s/uname//" /etc/mkinitcpio.conf
}
