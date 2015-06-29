#!/bin/sh

post_install() {
	echo " > Now add 'archlogo' to your HOOKS array in /etc/mkinitcpio.conf"
	echo " > and rebuild initial ramdisk."
	echo " > You can put your own artwork in /usr/share/archlogo/ and select"
	echo " > a non-default one in /etc/archlogo.conf."
}

post_remove() {
	sed -i "/^HOOKS=/s/archlogo//" /etc/mkinitcpio.conf
}
