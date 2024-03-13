#!/bin/bash
#https://cdn4.cnxclm.com/uploads/2024/03/05/3VDyAc0x_wechat-beta_1.0.0.145_amd64.deb?attname=wechat-beta_1.0.0.145_amd64.deb

busName=trash.chat.app
busDir="${XDG_RUNTIME_DIR}/app/${busName}"

function moeDect() {
	if [[ -f /usr/share/moeOS-Docs/os-release ]]; then
		osRel="/usr/share/moeOS-Docs/os-release"
	else
		osRel="/usr/lib/os-release"
	fi

}

function sourceXDG() {
	if [[ ! ${XDG_CONFIG_HOME} ]]; then
		source "${HOME}"/.config/user-dirs.dirs
		export XDG_CONFIG_HOME="${HOME}"/.config
	else
		source "${XDG_CONFIG_HOME}"/user-dirs.dirs
	fi
}

function manageDirs() {
	createWrapIfNotExist "${XDG_DOCUMENTS_DIR}"/WeChat_Data
	if [ -d "${HOME}/Documents/TrashBox" ]; then
		mv "${HOME}/Documents/TrashBox"/* \
			"${XDG_DOCUMENTS_DIR}"/WeChat_Data
	fi
}

function detectXauth() {
	if [ ! ${XAUTHORITY} ]; then
		echo '[Warn] No ${XAUTHORITY} detected! Do you have any X server running?'
		export XAUTHORITY="/$(uuidgen)/$(uuidgen)"
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
	ln -sf "${XDG_DOCUMENTS_DIR}"/WeChat_Data/Documents/xwechat_files "${XDG_DOCUMENTS_DIR}"/xwechat_files
}

function execApp() {
	touch "${XDG_DOCUMENTS_DIR}"/WeChat_Data/.flatpak-info
	bwrap \
		--dev /dev \
		--dev-bind /dev/dri /dev/dri \
		--dev-bind /dev/shm /dev/shm \
		--ro-bind /sys/dev/char /sys/dev/char \
		--ro-bind /sys/devices /sys/devices \
		--proc /proc \
		--dir /sandbox \
		--tmpfs /tmp \
		--bind /usr /usr \
		--ro-bind /etc /etc \
		--symlink usr/lib /lib \
		--symlink usr/lib64 /lib64 \
		--symlink usr/bin /bin \
		--symlink usr/bin /sbin \
		--ro-bind /usr/bin/true /usr/bin/lsblk \
		--bind /opt /opt \
		--ro-bind "${XDG_RUNTIME_DIR}/bus" "${XDG_RUNTIME_DIR}/bus" \
		--ro-bind "${XDG_RUNTIME_DIR}/pulse" "${XDG_RUNTIME_DIR}/pulse" \
		--bind "${XDG_DOCUMENTS_DIR}"/WeChat_Data "${HOME}" \
		--ro-bind-try "${XAUTHORITY}" "${XAUTHORITY}" \
		--unshare-all \
		--share-net \
		--ro-bind /usr/lib/wechat-uos-bwrap/open /sandbox/dde-file-manager \
		--ro-bind /usr/share/wechat-uos-bwrap/license/var/ /var/ \
		--ro-bind /usr/share/wechat-uos-bwrap/license/etc/os-release "${osRel}" \
		--ro-bind /usr/share/wechat-uos-bwrap/license/etc/lsb-release /etc/lsb-release \
		--ro-bind-try "${XDG_CONFIG_HOME}"/user-dirs.dirs "${XDG_CONFIG_HOME}"/user-dirs.dirs \
		--ro-bind-try "${XDG_CONFIG_HOME}"/fontconfig	"${XDG_CONFIG_HOME}"/fontconfig \
		--ro-bind-try "${XDG_CONFIG_HOME}"/Trolltech.conf "${XDG_CONFIG_HOME}"/Trolltech.conf \
		--ro-bind-try "${XDG_CONFIG_HOME}"/mimeapps.list "${XDG_CONFIG_HOME}"/mimeapps.list \
		--ro-bind-try "${XDG_CONFIG_HOME}"/kdeglobals "${XDG_CONFIG_HOME}"/kdeglobals \
		--ro-bind-try "${XDG_DOCUMENTS_DIR}"/WeChat_Data/.flatpak-info "${XDG_RUNTIME_DIR}/.flatpak-info" \
		--ro-bind-try "${XDG_DOCUMENTS_DIR}"/WeChat_Data/.flatpak-info /.flatpak-info \
		--dir "${XDG_DOCUMENTS_DIR}" \
		--setenv QT_QPA_PLATFORM xcb \
		--setenv LD_LIBRARY_PATH /opt/wechat-uos-bwrap/files:/usr/lib/wechat-uos-bwrap/so \
		--setenv QT_AUTO_SCREEN_SCALE_FACTOR 1 \
		--setenv PATH /sandbox:"${PATH}" \
		--setenv QT_PLUGIN_PATH "/usr/lib/qt/plugins /opt/wechat-uos-bwrap/files/wechat" \
		/opt/wechat-uos-bwrap/files/wechat
}

function dbusProxy() {
	mkdir "${busDir}" -p
	bwrap \
		--new-session \
		--symlink /usr/lib64 /lib64 \
		--ro-bind /usr/lib /usr/lib \
		--ro-bind /usr/lib64 /usr/lib64 \
		--ro-bind /usr/bin /usr/bin \
		--bind "${XDG_RUNTIME_DIR}" "${XDG_RUNTIME_DIR}" \
		--ro-bind-try "${XDG_DOCUMENTS_DIR}"/WeChat_Data/.flatpak-info /.flatpak-info \
		--ro-bind-try "${XDG_DOCUMENTS_DIR}"/WeChat_Data/.flatpak-info "${XDG_RUNTIME_DIR}/.flatpak-info" \
		--die-with-parent \
		-- \
		env -i xdg-dbus-proxy \
			"${DBUS_SESSION_BUS_ADDRESS}" \
			"${busDir}/bus" \
			--filter \
			--log \
			--talk=org.freedesktop.portal.Flatpak \
			--call="org.freedesktop.portal.Desktop=org.freedesktop.portal.Settings.Read@/org/freedesktop/portal/desktop" \
			--broadcast="org.freedesktop.portal.Desktop=org.freedesktop.portal.Settings.SettingChanged@/org/freedesktop/portal/desktop" 3<<EOF
[Application]
name=$busName
EOF
}

function execAppUnsafe() {
	bwrap \
		--dev-bind / / \
		--ro-bind /usr/share/wechat-uos-bwrap/license/var/ /var/ \
		--ro-bind /usr/share/wechat-uos-bwrap/license/etc/os-release "${osRel}" \
		--ro-bind /usr/share/wechat-uos-bwrap/license/etc/lsb-release /etc/lsb-release \
		--setenv QT_QPA_PLATFORM xcb \
		--setenv LD_LIBRARY_PATH /opt/wechat-uos-bwrap/files:/usr/lib/wechat-uos-bwrap/so \
		--setenv QT_AUTO_SCREEN_SCALE_FACTOR 1 \
		--setenv PATH /sandbox:"${PATH}" \
		--setenv QT_PLUGIN_PATH "/usr/lib/qt/plugins /opt/wechat-uos-bwrap/files/wechat" \
		/opt/wechat-uos-bwrap/files/wechat
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
		dbusProxy &
		sleep 0.1
		execApp
	fi
}

sourceXDG
manageDirs
launch $@

