#!/bin/sh

post_install() {
	echo " > Now add 'randommac' to your HOOKS array in /etc/mkinitcpio.conf"
	echo " > and rebuild initial ramdisk. This will initialize first network"
	echo " > device with a random MAC address when 'randommac' is set on the"
	echo " > kernel command line."
}

post_remove() {
	sed -i "/^HOOKS=/s/randommac//" /etc/mkinitcpio.conf
}
