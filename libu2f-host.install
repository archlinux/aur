#!/bin/sh

post_upgrade() {
	if systemctl -q is-active systemd-udevd; then
		udevadm control --reload-rules
	fi
}

post_install() {
	post_upgrade
}

post_remove() {
	post_upgrade
}
