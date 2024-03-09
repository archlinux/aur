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

function detectXauth() {
	if [ ! ${XAUTHORITY} ]; then
		export XAUTHORITY=/dev/null
	fi
	if [[ ! ${DISPLAY} ]]; then
		echo '[Warn] No ${DISPLAY} detected! Do you have any X server running?'
	fi
}

function createWrapIfNotExist() {
	if [ -d "$@" ]; then
		return 0
	else
		mkdir -p "$@"
	fi
}

function inputMethod() {
	if [[ ${XMODIFIERS} =~ fcitx ]]; then
		export QT_IM_MODULE=fcitx
		export GTK_IM_MODULE=fcitx
	elif [[ ${XMODIFIERS} =~ ibus ]]; then
		export QT_IM_MODULE=ibus
		export GTK_IM_MODULE=ibus
		export IBUS_USE_PORTAL=1
	fi
}

function lnDir() {
	if [ ! -d "${HOME}"/xwechat_files ]; then
		ln -s "${XDG_DOCUMENTS_DIR}"/WeChat_Data/xwechat_files "${HOME}"/xwechat_files
	fi
}

function execApp() {
	bwrap \
		--tmpfs /tmp \
		--symlink usr/lib /lib \
		--symlink usr/lib64 /lib64 \
		--symlink usr/bin /bin \
		--symlink usr/bin /sbin \
		--ro-bind /opt /opt \
		--ro-bind "$XDG_RUNTIME_DIR/bus" "$XDG_RUNTIME_DIR/bus" \
		--ro-bind "$XDG_RUNTIME_DIR/pulse" "$XDG_RUNTIME_DIR/pulse" \
		--dev /dev \
		--dev-bind /dev/dri /dev/dri \
		--dev-bind /dev/shm /dev/shm \
		--ro-bind /sys/dev/char /sys/dev/char \
		--ro-bind /sys/devices /sys/devices \
		--proc /proc \
		--ro-bind /usr /usr \
		--bind "${XDG_DOCUMENTS_DIR}"/WeChat_Data "${HOME}" \
		--bind "${XDG_DOCUMENTS_DIR}"/WeChat_Downloads "${XDG_DOWNLOAD_DIR}" \
		--ro-bind-try "${XAUTHORITY}" "${XAUTHORITY}" \
		--ro-bind /etc /etc \
		--unshare-all \
		--share-net \
		--bind /usr/bin/true /usr/bin/lsblk \
		--ro-bind /usr/share/wechat-uos/var/ /var/ \
		--ro-bind /usr/share/wechat-uos/etc/os-release "${osRel}" \
		--ro-bind /usr/share/wechat-uos/etc/lsb-release /etc/lsb-release \
		--ro-bind /usr/lib/wechat-uos/license/ /usr/lib/license/ \
		--ro-bind /usr/lib/snapd-xdg-open/xdg-open /usr/bin/xdg-open \
		--setenv QT_QPA_PLATFORM xcb \
		--setenv LD_LIBRARY_PATH /opt/wechat-beta:/usr/lib/wechat-uos/license \
		--setenv QT_AUTO_SCREEN_SCALE_FACTOR 1 \
		/opt/wechat-beta/wechat
}

function execAppUnsafe() {
	bwrap \
		--dev-bind / / \
		--ro-bind /usr/share/wechat-uos/var/ /var/ \
		--ro-bind /usr/share/wechat-uos/etc/os-release "${osRel}" \
		--ro-bind /usr/share/wechat-uos/etc/lsb-release /etc/lsb-release \
		--ro-bind /usr/lib/wechat-uos/license/ /usr/lib/license/ \
		--setenv QT_QPA_PLATFORM xcb \
		--setenv LD_LIBRARY_PATH /opt/wechat-beta:/usr/lib/wechat-uos/license \
		/opt/wechat-beta/wechat
}

function launch() {
	detectXauth
	inputMethod
	moeDect
	lnDir
	echo "Launching WeChat Beta..."
	if [[ ${trashAppUnsafe} = 1 ]]; then
		execAppUnsafe
	else
		execApp
	fi
}

manageDirs
launch $@

