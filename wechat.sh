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
	if [[ ! ${XDG_DATA_HOME} ]]; then
		export XDG_DATA_HOME="${HOME}"/.local/share
	fi
}

function manageDirs() {
	if [ -d "${HOME}/Documents/TrashBox" ]; then
		echo "[Warn] Old user data may be present, check ${HOME}/Documents/TrashBox"
	fi
	if [ -d "${XDG_DOCUMENTS_DIR}/WeChat_Data/文档" ]; then
		mv "${XDG_DOCUMENTS_DIR}/WeChat_Data/文档" \
			"${XDG_DOCUMENTS_DIR}/WeChat_Data/Documents"
	fi
	if [ -d "${XDG_DOCUMENTS_DIR}"/WeChat_Data ]; then
		echo "[Info] Migrating user data..."
		mv "${XDG_DOCUMENTS_DIR}"/WeChat_Data "${XDG_DATA_HOME}"/WeChat_Data
	fi
	if [ -d "${XDG_DOCUMENTS_DIR}"/xwechat_files ]; then
		echo "[Info] Removing unused links..."
		rm "${XDG_DOCUMENTS_DIR}"/xwechat_files
	fi
	createWrapIfNotExist "${XDG_DATA_HOME}"/WeChat_Data
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
		QT_IM_MODULE=fcitx
		GTK_IM_MODULE=fcitx
	elif [[ ${XMODIFIERS} =~ ibus ]]; then
		QT_IM_MODULE=ibus
		GTK_IM_MODULE=ibus
		IBUS_USE_PORTAL=1
	elif [[ ${XMODIFIERS} =~ gcin ]]; then
		QT_IM_MODULE=ibus
		GTK_IM_MODULE=gcin
		LC_CTYPE=zh_TW.UTF-8
	else
		echo '[Warn] Input Method potentially broken! Please set $XMODIFIERS properly'
	fi
}

function lnDir() {
	# Deprecated function
	if [ -d "${XDG_DATA_HOME}"/WeChat_Data/Documents/xwechat_files ]; then
		ln -srf "${XDG_DATA_HOME}"/WeChat_Data/xwechat_files \
			"${HOME}"/xwechat_files
	fi
}

function importEnv() {
	if [ -e "${XDG_DATA_HOME}"/WeChat_Data/wechat.env ]; then
		echo "[Info] ${XDG_DATA_HOME}/WeChat_Data/wechat.env exists"
	else
		touch "${XDG_DATA_HOME}"/WeChat_Data/wechat.env
	fi
	if [[ $(cat "${XDG_DATA_HOME}"/WeChat_Data/wechat.env) ]]; then
		return 0
	else
		echo "# Envs" >>"${XDG_DATA_HOME}"/WeChat_Data/wechat.env
		echo "isWeChatEnvPresent=1" >>"${XDG_DATA_HOME}"/WeChat_Data/wechat.env
	fi
}

function cameraDect() {
	bwCamPar=""
	for camera in $(ls /dev/video*); do
		if [ -e ${camera} ]; then
			echo "[Info] Binding camera ${camera}"
			bwCamPar="${bwCamPar} --dev-bind ${camera} ${camera}"
		fi
	done
}

function execApp() {
	# Wayland is not available for now
	# 	--ro-bind-try "${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}" \
	#			"${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}" \
	
	if [[ ${wechatXserverPatch} = 1 ]]; then
		xhost +
	fi
	touch "${XDG_DATA_HOME}"/WeChat_Data/.flatpak-info
	cameraDect
	importEnv
	systemd-run --user ${sdOption} \
	-p CPUWeight=50 \
	-p IOWeight=40 \
	-p IPAccounting=yes \
	-p UnsetEnvironment=XDG_CURRENT_DESKTOP \
	-p UnsetEnvironment=WAYLAND_DISPLAY \
	-p UnsetEnvironment=XDG_SESSION_TYPE \
	-p PrivateIPC=yes \
	-p DevicePolicy=strict \
	-p EnvironmentFile=/usr/lib/wechat-uos-qt/envs \
	-p EnvironmentFile="${XDG_DATA_HOME}"/WeChat_Data/wechat.env \
	-p Environment=GTK_IM_MODULE="${GTK_IM_MODULE}" \
	-p Environment=QT_IM_MODULE="${QT_IM_MODULE}" \
	-p IPAddressDeny=localhost \
	-p IPAddressDeny=link-local \
	-p IPAddressDeny=multicast \
	-p SystemCallFilter=~@clock \
	-p SystemCallFilter=~@cpu-emulation \
	-p SystemCallFilter=~@debug \
	-p SystemCallFilter=~@module \
	-p SystemCallFilter=~@obsolete \
	-p SystemCallFilter=~@raw-io \
	-p SystemCallFilter=~@reboot \
	-p SystemCallFilter=~@swap \
	-p ProcSubset=pid \
	-p RestrictAddressFamilies=AF_UNIX \
	-p RestrictAddressFamilies=AF_INET \
	-p RestrictAddressFamilies=AF_INET6 \
	-p NoNewPrivileges=yes \
	-p RestrictNamespaces=~net \
	-p RestrictNamespaces=~pid \
	-p RestrictNamespaces=~uts \
	-p RestrictNamespaces=~ipc \
	-p ProtectControlGroups=yes \
	-p KeyringMode=private \
	-p ProtectClock=yes \
	-p CapabilityBoundingSet= \
	-p ProtectKernelModules=yes \
	-p SystemCallArchitectures=native \
	-p RestrictNamespaces=no \
	-p RestrictSUIDSGID=yes \
	-p LockPersonality=yes \
	-p RestrictRealtime=yes \
	-p ProtectSystem=strict \
	-p ProtectProc=invisible \
	-p ProtectHome=no \
	-p PrivateUsers=yes \
	-p UMask=077 \
	-p RestrictAddressFamilies=~AF_NETLINK \
	-p RestrictAddressFamilies=~AF_PACKET \
	-p PrivateTmp=yes \
	-p BindReadOnlyPaths=/usr/bin/true:/usr/bin/lsblk \
	-p BindReadOnlyPaths=/opt/wechat-uos-qt/files:/usr/lib/license \
	-p BindReadOnlyPaths=-/run/systemd/resolve/stub-resolv.conf \
	-- \
	bwrap \
		--dev /dev \
		--dev-bind /dev/dri /dev/dri \
		--dev-bind /dev/shm /dev/shm \
		--tmpfs /sys \
		--ro-bind /sys/dev/char /sys/dev/char \
		--ro-bind /sys/devices /sys/devices \
		--proc /proc \
		--dir /sandbox \
		--bind /tmp /tmp \
		--bind /usr /usr \
		--ro-bind /etc /etc \
		--symlink usr/lib /lib \
		--symlink usr/lib64 /lib64 \
		--symlink usr/bin /bin \
		--symlink usr/bin /sbin \
		--bind /opt /opt \
		--bind "${busDir}/bus" "${XDG_RUNTIME_DIR}/bus" \
		--ro-bind "${XDG_RUNTIME_DIR}/pulse" \
			"${XDG_RUNTIME_DIR}/pulse" \
		--bind "${XDG_DATA_HOME}"/WeChat_Data "${HOME}" \
		--ro-bind-try "${XAUTHORITY}" "${XAUTHORITY}" \
		--unshare-all \
		--share-net \
		--unshare-user \
		--disable-userns \
		--ro-bind /usr/lib/wechat-uos-qt/open \
			/sandbox/dde-file-manager \
		--ro-bind /usr/share/wechat-uos-qt/license/var/ /var/ \
		--ro-bind /usr/share/wechat-uos-qt/license/etc/os-release \
			"${osRel}" \
		--ro-bind /usr/share/wechat-uos-qt/license/etc/lsb-release \
			/etc/lsb-release \
		--ro-bind /usr/lib/wechat-uos-qt/user-dirs.dirs \
			"${XDG_CONFIG_HOME}"/user-dirs.dirs \
		--ro-bind-try "${XDG_CONFIG_HOME}"/fontconfig \
			"${XDG_CONFIG_HOME}"/fontconfig \
		--ro-bind-try "${XDG_DATA_HOME}/fonts" \
			"${XDG_DATA_HOME}/fonts" \
		--ro-bind-try "${XDG_CONFIG_HOME}"/Trolltech.conf \
			"${XDG_CONFIG_HOME}"/Trolltech.conf \
		--ro-bind-try "${XDG_CONFIG_HOME}"/mimeapps.list \
			"${XDG_CONFIG_HOME}"/mimeapps.list \
		--ro-bind-try "${XDG_CONFIG_HOME}"/kdeglobals \
			"${XDG_CONFIG_HOME}"/kdeglobals \
		--ro-bind-try "${XDG_DATA_HOME}"/WeChat_Data/.flatpak-info \
			"${XDG_RUNTIME_DIR}/.flatpak-info" \
		--ro-bind-try "${XDG_DATA_HOME}"/WeChat_Data/.flatpak-info \
			/.flatpak-info \
		--ro-bind-try "/run/systemd/resolve/stub-resolv.conf" \
			"/run/systemd/resolve/stub-resolv.conf" \
		--dir "${XDG_DOCUMENTS_DIR}" \
		${bwCamPar} \
		--setenv XDG_DOCUMENTS_DIR "${XDG_DOCUMENTS_DIR}" \
		--setenv XDG_DATA_HOME "${XDG_DATA_HOME}" \
		-- \
			"${launchTarget}"
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
		--ro-bind-try "${XDG_DATA_HOME}"/WeChat_Data/.flatpak-info \
			/.flatpak-info \
		--ro-bind-try "${XDG_DATA_HOME}"/WeChat_Data/.flatpak-info \
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
	systemd-run --user \
		-p EnvironmentFile=/usr/lib/wechat-uos-qt/envs \
		--tty \
		bwrap \
		--dev-bind / / \
		--bind /opt/wechat-uos-qt/files \
			/usr/lib/license \
		--ro-bind /usr/share/wechat-uos-qt/license/var/ \
			/var/ \
		--ro-bind /usr/share/wechat-uos-qt/license/etc/os-release \
			"${osRel}" \
		--ro-bind /usr/share/wechat-uos-qt/license/etc/lsb-release \
			/etc/lsb-release \
		--setenv QT_QPA_PLATFORM xcb \
		--setenv LD_LIBRARY_PATH /opt/wechat-uos-qt/files:/usr/lib/wechat-uos-qt/so:/usr/lib/wechat-uos-qt/so \
		--setenv QT_AUTO_SCREEN_SCALE_FACTOR 1 \
		--setenv PATH /sandbox:"${PATH}" \
		--setenv QT_PLUGIN_PATH "/usr/lib/qt/plugins /opt/wechat-uos-qt/files/wechat" \
		"${launchTarget}"
}

function disableSandbox() {
	if [[ $@ =~ "f5aaebc6-0014-4d30-beba-72bce57e0650" ]] && [[ $@ =~ "--actions" ]]; then
		if [[ "${LANG}" =~ 'zh_CN' ]]; then
			zenity --title "稍等片刻..." --icon=security-medium-symbolic --default-cancel --question --text="允许微信读取 / 修改所有个人数据?"
		else
			zenity --title "Hold on..." --icon=security-medium-symbolic --default-cancel --question --text="Do you wish WeChat to access and modify all of your data?"
		fi
		if [[ $? = 0 ]]; then
			export trashAppUnsafe=1
			if [[ "${LANG}" =~ 'zh_CN' ]]; then
				zenity --error --title "沙盒已禁用" --icon=security-low-symbolic --text "用户数据不再被保护"
			else
				zenity --error --title "Sandbox disabled" --icon=security-low-symbolic --text "User data is potentially compromised"
			fi
		else
			echo "[Critical] Request canceled by user"
			exit 1
		fi
	fi
	if [[ ${wechatUnsafe} = 1 ]]; then
		export trashAppUnsafe=1
	fi
}

function openDataDir() {
	if [[ $@ =~ "--actions" ]] && [[ $@ =~ "opendir" ]]; then
		xdg-open "${XDG_DATA_HOME}"/WeChat_Data
		exit $?
	fi
}

function launch() {
	detectXauth
	inputMethod
	moeDect
	#lnDir
	if [[ $@ =~ "--actions" ]] && [[ $@ =~ "debug-shell" ]]; then
		launchTarget="bash"
	else
		launchTarget="/opt/wechat-uos-qt/files/wechat"
	fi
	if [[ $@ =~ "--actions" ]] && [[ $@ =~ "disconnect-tty" ]]; then
		sdOption="-P"
	else
		sdOption="-t"
	fi
	if [[ $@ =~ "--actions" ]] && [[ $@ =~ "gamescope" ]]; then
		export QT_SCREEN_SCALE_FACTOR=2
		launchTarget="gamescope -F fsr --sharpness 0 -S integer -- /opt/wechat-uos-qt/files/wechat"
	fi
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
openDataDir $@
manageDirs
launch $@

