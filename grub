#!/bin/bash

build() {
	echo "Updating GRUB..."
	file="/tmp/updategrub.lock"
	if [ -e $file ]; then
		rm /tmp/updategrub.lock
		echo "GRUB already updated. Nothing to be done."
	else 
		touch /tmp/updategrub.lock
		grub-mkconfig -o /boot/grub/grub.cfg
	fi 
}

help() {
	cat <<HELPEOF
	Update GRUB after a kernel update
HELPEOF
}
