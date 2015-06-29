#!/bin/sh

post_install() {
	echo " > Now add 'hostname' to your HOOKS array in /etc/mkinitcpio.conf"
	echo " > and rebuild initial ramdisk."
	echo " > Attention: This will overwrite your /etc/hostname!"
}

post_remove() {
	sed -i "/^HOOKS=/s/hostname//" /etc/mkinitcpio.conf
}
