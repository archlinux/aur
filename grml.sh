#!/bin/sh
# Run by grml-autoconfig when the boot option "scripts" is set.
# The boot medium (here: the ESP) is mounted at /run/live/medium.
MEDIUM=/run/live/medium

# Keymap: set from the host's /etc/vconsole.conf by the package install script.
loadkeys us

# WLAN: grml has no NetworkManager, so use wpa_supplicant + dhcpcd.
# With net.ifnames=0 the interface is called wlan0. Only if a wpa.conf exists
# (template: wpa.conf.example, PSK hash via: wpa_passphrase 'SSID' 'password').
if [ -r "$MEDIUM/scripts/wpa.conf" ]; then
	rfkill unblock wifi
	# grml-autoconfig.service is Type=oneshot without RemainAfterExit: when it
	# finishes, systemd kills everything left in its cgroup, including daemons
	# forked from here. Run them as transient units (foreground mode) instead.
	# Status: systemctl status grml-wpa_supplicant grml-dhcpcd
	systemd-run --quiet --unit=grml-wpa_supplicant \
		wpa_supplicant -i wlan0 -c "$MEDIUM/scripts/wpa.conf"
	systemd-run --quiet --unit=grml-dhcpcd dhcpcd -B wlan0
fi

# Files that need permissions/ownership (root/bin, root/.zshrc, etc/wpa_supplicant ...)
# come from /config.tbz on the ESP via the boot option "config", not from here:
#   mount -o remount,rw "$MEDIUM"
#   tar cjf "$MEDIUM/config.tbz" -C / root/.zshrc root/bin etc/wpa_supplicant
