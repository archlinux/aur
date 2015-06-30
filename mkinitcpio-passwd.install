#!/bin/sh

post_install() {
	echo " > Now add 'passwd' to your HOOKS array in /etc/mkinitcpio.conf"
	echo " > and rebuild initial ramdisk."
	echo " > You can then set password with password=user:password or"
	echo " > pwhash=user:passwordhash"
	echo " > Add secure shell authorized key with authorized_key=user:type:key"
}

post_remove() {
	sed -i "/^HOOKS=/s/passwd//" /etc/mkinitcpio.conf
}
