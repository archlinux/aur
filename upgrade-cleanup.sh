#!/bin/bash
ver2=$(pacman -Q splashtop-streamer 2>&1 |grep -i -c -E "splashtop-streamer (2\.[0-9]\.)")
if [[ "$ver2" -ne 0 ]];
then
echo "Cleaning up old install"
	if [ -f "/etc/systemd/system/SRStreamer.service" ]; then
		echo "[Splashtop-Streamer] Stop streamer service"
	    systemctl disable SRStreamer.service
		echo "[Splashtop-Streamer] Remove streamer service"
	    rm /usr/lib/systemd/system/SRStreamer.service
	    systemctl daemon-reload
		pidof SRFeature | xargs kill -9
		if [ "$(pgrep -f 'SRStreamer.pyc' | wc -w)" != 0 ]; then
			pgrep -f SRStreamer.pyc | xargs kill -9
		fi
	fi
	if [ -e /etc/pam.d/common-session ]; then
		sed -i '/session optional    pam_splashtop.so/d' /etc/pam.d/common-session
		if [ -f "/usr/lib/x86_64-linux-gnu/security/pam_splashtop.so" ]; then
			echo "[Splashtop-Streamer] Remove PAM module, as not needed."
			rm /usr/lib/x86_64-linux-gnu/security/pam_splashtop.so
		fi
	fi
    find /home -type f | grep /.config/autostart/com.splashtop.streamer.desktop | xargs rm -f
	cp /opt/splashtop-streamer/config/global.conf /tmp/streamerconf
    rm /usr/bin/splashtop-streamer
	rm -rf /opt/splashtop-streamer
	mkdir -p /opt/splashtop-streamer/config/
	mv /tmp/streamerconf /opt/splashtop-streamer/config/global.conf
	chmod a=rwx /opt/splashtop-streamer/config

fi
