#!/bin/bash

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
	if [ -d "${XDG_DOCUMENTS_DIR}"/WeChat_Data/xwechat_files ]; then
		ln -s "${XDG_DOCUMENTS_DIR}"/WeChat_Data/xwechat_files \
			"${HOME}"/xwechat_files
	fi
	ln -sf "${XDG_DOCUMENTS_DIR}"/WeChat_Data/Documents/xwechat_files \
		"${XDG_DOCUMENTS_DIR}"/xwechat_files
}

function cameraDect() {
	export bwCamPar="--dev-bind-try /dev/video /dev/video"
	for camera in $(ls /dev/video*); do
		echo "[Info] Binding camera ${camera}"
		bwCamPar="${bwCamPar} --dev-bind ${camera} ${camera}"
	done
}

function execApp() {
	touch "${XDG_DOCUMENTS_DIR}"/WeChat_Data/.flatpak-info
	cameraDect
	bwrap \
		--cap-drop ALL \
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
		--bind "${busDir}/bus" "${XDG_RUNTIME_DIR}/bus" \
		--ro-bind "${XDG_RUNTIME_DIR}/pulse" \
			"${XDG_RUNTIME_DIR}/pulse" \
		--bind "${XDG_DOCUMENTS_DIR}"/WeChat_Data "${HOME}" \
		--ro-bind-try "${XAUTHORITY}" "${XAUTHORITY}" \
		--unshare-all \
		--share-net \
		--ro-bind /usr/lib/wechat-uos-qt/open \
			/sandbox/dde-file-manager \
		--ro-bind /usr/share/wechat-uos-qt/license/var/ /var/ \
		--ro-bind /usr/share/wechat-uos-qt/license/etc/os-release \
			"${osRel}" \
		--ro-bind /usr/share/wechat-uos-qt/license/etc/lsb-release \
			/etc/lsb-release \
		--ro-bind-try "${XDG_CONFIG_HOME}"/user-dirs.dirs \
			"${XDG_CONFIG_HOME}"/user-dirs.dirs \
		--ro-bind-try "${XDG_CONFIG_HOME}"/fontconfig \
			"${XDG_CONFIG_HOME}"/fontconfig \
		--ro-bind-try "${XDG_CONFIG_HOME}"/Trolltech.conf \
			"${XDG_CONFIG_HOME}"/Trolltech.conf \
		--ro-bind-try "${XDG_CONFIG_HOME}"/mimeapps.list \
			"${XDG_CONFIG_HOME}"/mimeapps.list \
		--ro-bind-try "${XDG_CONFIG_HOME}"/kdeglobals \
			"${XDG_CONFIG_HOME}"/kdeglobals \
		--ro-bind-try "${XDG_DOCUMENTS_DIR}"/WeChat_Data/.flatpak-info \
			"${XDG_RUNTIME_DIR}/.flatpak-info" \
		--ro-bind-try "${XDG_DOCUMENTS_DIR}"/WeChat_Data/.flatpak-info \
			/.flatpak-info \
		--dir "${XDG_DOCUMENTS_DIR}" \
		${bwCamPar} \
		--setenv QT_QPA_PLATFORM xcb \
		--setenv LD_LIBRARY_PATH \
			/opt/wechat-uos-qt/files:/usr/lib/wechat-uos-qt/so \
		--setenv QT_AUTO_SCREEN_SCALE_FACTOR 1 \
		--setenv PATH /sandbox:"${PATH}" \
		/opt/wechat-uos-qt/files/wechat
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
		--ro-bind-try "${XDG_DOCUMENTS_DIR}"/WeChat_Data/.flatpak-info \
			/.flatpak-info \
		--ro-bind-try "${XDG_DOCUMENTS_DIR}"/WeChat_Data/.flatpak-info \
			"${XDG_RUNTIME_DIR}/.flatpak-info" \
		--die-with-parent \
		-- \
		env -i xdg-dbus-proxy \
			"${DBUS_SESSION_BUS_ADDRESS}" \
			"${busDir}/bus" \
			--log \
			--call=org.freedesktop.portal.Desktop=*=* \
			--talk=org.gnome.Shell.Screenshot \
			--talk=org.freedesktop.portal.Screenshot \
			--broadcast=org.freedesktop.portal.*=@/org/freedesktop/portal/*
}

function execAppUnsafe() {
	killall wechat
	bwrap \
		--dev-bind / / \
		--ro-bind /usr/share/wechat-uos-qt/license/var/ /var/ \
		--ro-bind /usr/share/wechat-uos-qt/license/etc/os-release "${osRel}" \
		--ro-bind /usr/share/wechat-uos-qt/license/etc/lsb-release /etc/lsb-release \
		--setenv QT_QPA_PLATFORM xcb \
		--setenv LD_LIBRARY_PATH /opt/wechat-uos-qt/files:/usr/lib/wechat-uos-qt/so \
		--setenv QT_AUTO_SCREEN_SCALE_FACTOR 1 \
		--setenv PATH /sandbox:"${PATH}" \
		--setenv QT_PLUGIN_PATH "/usr/lib/qt/plugins /opt/wechat-uos-qt/files/wechat" \
		/opt/wechat-uos-qt/files/wechat
}

function disableSandbox() {
	if [[ $@ =~ "f5aaebc6-0014-4d30-beba-72bce57e0650" ]] && [[ $@ =~ "--actions" ]]; then
		if [[ "LANG" =~ 'zh_CN' ]]; then
			zenity --title "警告" --question --text="确认以继续危险操作..."
		else
			zenity --title "Alert" --question --text="Confirm to proceed dangerous operation..."
		fi
		if [[ $? = 0 ]]; then
			export trashAppUnsafe=1
		else
			echo "[Critical] Request canceled by user"
			exit 1
		fi
	fi
	if [[ ${wechatUnsafe} = 1 ]]; then
		export trashAppUnsafe=1
	fi
}

function launch() {
	detectXauth
	inputMethod
	moeDect
	lnDir
	if [[ ${trashAppUnsafe} = 1 ]]; then
		echo "Launching WeChat UOS (unsafe)..."
		execAppUnsafe
	else
		echo "Launching WeChat UOS..."
		dbusProxy &
		sleep 0.1
		execApp
	fi
}

disableSandbox $@
sourceXDG
manageDirs
launch $@

