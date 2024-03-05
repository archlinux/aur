#!/bin/bash
#https://cdn4.cnxclm.com/uploads/2024/03/05/3VDyAc0x_wechat-beta_1.0.0.145_amd64.deb?attname=wechat-beta_1.0.0.145_amd64.deb

function moeDect() {
	if [[ -f /usr/share/moeOS-Docs/os-release ]]; then
		osRel="/usr/share/moeOS-Docs/os-release"
	else
		osRel="/usr/lib/os-release"
	fi

}

function gamescopeLaunch() {
	gamescope -F fsr --sharpness 0 -- launch
}

function launch() {
	bwrap \
		--dir "$XDG_RUNTIME_DIR" \
		--dir /tmp \
		--symlink usr/lib /lib \
		--symlink usr/lib64 /lib64 \
		--symlink usr/bin /bin \
		--symlink usr/bin /sbin \
		--ro-bind /opt /opt \
		--bind "$XDG_RUNTIME_DIR/bus" "$XDG_RUNTIME_DIR/bus" \
		--bind "$XDG_RUNTIME_DIR/pulse" "$XDG_RUNTIME_DIR/pulse" \
		--dev /dev \
		--dev-bind /dev/dri /dev/dri \
		--dev-bind /dev/shm /dev/shm \
		--ro-bind /sys/dev/char /sys/dev/char \
		--proc /proc \
		--ro-bind /usr /usr \
		--bind "${HOME}/Documents/TrashBox" "$HOME" \
		--bind "${XAUTHORITY}" "${XAUTHORITY}" \
		--ro-bind /etc /etc \
		--hostname trash \
		--unshare-uts \
		--bind /usr/share/wechat-uos/var/ /var/ \
		--bind /usr/share/wechat-uos/etc/os-release /usr/share/moeOS-Docs/os-release \
		--bind /usr/share/wechat-uos/etc/lsb-release /etc/lsb-release \
		--bind /usr/lib/wechat-uos/license/ /usr/lib/license/ \
		env QT_QPA_PLATFORM=xcb \
			GTK_USE_PORTAL=1 \
			LD_LIBRARY_PATH=/opt/wechat-beta \
			LIBVA_DRIVER_NAME=iHD \
			LD_PRELOAD=/usr/lib/wechat-uos/license/libuosdevicea.so \
			/opt/wechat-beta/wechat
}

launch
