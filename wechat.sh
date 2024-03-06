#!/bin/bash
#https://cdn4.cnxclm.com/uploads/2024/03/05/3VDyAc0x_wechat-beta_1.0.0.145_amd64.deb?attname=wechat-beta_1.0.0.145_amd64.deb

function moeDect() {
	if [[ -f /usr/share/moeOS-Docs/os-release ]]; then
		osRel="/usr/share/moeOS-Docs/os-release"
	else
		osRel="/usr/lib/os-release"
	fi

}

function sourceXDG() {
	if [[ -d "${HOME}"/.config ]]; then
		source "${HOME}"/.config/user-dirs.dirs
	else
		source "${XDG_CONFIG_HOME}"/user-dirs.dirs
	fi
}

function manageDirs() {
	sourceXDG
	createWrapIfNotExist "${XDG_DOCUMENTS_DIR}"/WeChat_Downloads
	createWrapIfNotExist "${XDG_DOCUMENTS_DIR}"/WeChat_Data
	if [ -d "${HOME}/Documents/TrashBox" ]; then
		mv "${HOME}/Documents/TrashBox"/* \
			"${XDG_DOCUMENTS_DIR}"/WeChat_Data
	fi
}

function createWrapIfNotExist() {
	if [ -d "$@" ]; then
		return 0
	else
		mkdir -p "$@"
	fi
}

function gamescopeLaunch() {
	gamescope -F fsr --sharpness 0 -- launch
}

function inputMethod() {
	if [[ ${XMODIFIERS} =~ fcitx ]]; then
		QT_IM_MODULE=fcitx
	elif [[ ${XMODIFIERS} =~ ibus ]]; then
		QT_IM_MODULE=ibus
		IBUS_USE_PORTAL=1
	fi
}

function launch() {
	echo "Launching WeChat Beta..."
	bwrap \
		--dir /tmp \
		--symlink usr/lib /lib \
		--symlink usr/lib64 /lib64 \
		--symlink usr/bin /bin \
		--symlink usr/bin /sbin \
		--ro-bind /opt /opt \
		--bind "$XDG_RUNTIME_DIR" "$XDG_RUNTIME_DIR" \
		--chmod 0700 "$XDG_RUNTIME_DIR" \
		--dev /dev \
		--dev-bind /dev/dri /dev/dri \
		--dev-bind /dev/shm /dev/shm \
		--proc /proc \
		--ro-bind /usr /usr \
		--bind "${XDG_DOCUMENTS_DIR}"/WeChat_Data "${HOME}" \
		--bind "${XDG_DOCUMENTS_DIR}"/WeChat_Downloads "${XDG_DOWNLOAD_DIR}" \
		--bind-try "${XAUTHORITY}" "${XAUTHORITY}" \
		--ro-bind /etc /etc \
		--hostname trash \
		--unshare-uts \
		--bind /usr/share/wechat-uos/var/ /var/ \
		--bind /usr/share/wechat-uos/etc/os-release "${osRel}" \
		--bind /usr/share/wechat-uos/etc/lsb-release /etc/lsb-release \
		--bind /usr/lib/wechat-uos/license/ /usr/lib/license/ \
		--bind /dev/null /sys/dev/block \
		--unsetenv __EGL_VENDOR_LIBRARY_FILENAMES \
		--ro-bind /usr/lib/snapd-xdg-open/xdg-open /usr/bin/xdg-open \
		env QT_QPA_PLATFORM=xcb \
			GTK_USE_PORTAL=1 \
			LD_LIBRARY_PATH=/opt/wechat-beta \
			LD_PRELOAD=/usr/lib/wechat-uos/license/libuosdevicea.so \
			/opt/wechat-beta/wechat

}

function launchDbusProxy() {
	APP_NAME=trash.wechat.beta
	APP_FOLDER="$XDG_RUNTIME_DIR/app/$APP_NAME"
	mkdir -p "$APP_FOLDER"
	bwrap \
		--new-session \
		--symlink /usr/lib64 /lib64 \
		--ro-bind /usr/lib /usr/lib \
		--ro-bind /usr/lib64 /usr/lib64 \
		--ro-bind /usr/bin /usr/bin \
		--bind "$XDG_RUNTIME_DIR" "$XDG_RUNTIME_DIR" \
		--ro-bind-data 3 "/.flatpak-info" \
		--die-with-parent \
		-- \
		env -i xdg-dbus-proxy \
			"$DBUS_SESSION_BUS_ADDRESS" \
			"$APP_FOLDER/bus" \
			--filter \
			--log \
			--talk=org.freedesktop.portal.Flatpak \
			--call="org.freedesktop.portal.Desktop=org.freedesktop.portal.Settings.Read@/org/freedesktop/portal/desktop" \
			--broadcast="org.freedesktop.portal.Desktop=org.freedesktop.portal.Settings.SettingChanged@/org/freedesktop/portal/desktop" 3<<EOF
[Application]
name=$APP_NAME
EOF
}

manageDirs
moeDect
inputMethod
#launchDbusProxy &
sleep 0.1
launch $@

