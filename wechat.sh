#!/bin/bash

# wechat-beta only support xcb
BWRAP_ENV_APPEND="--setenv QT_QPA_PLATFORM xcb "
WECHAT_DATA_DIR="$(xdg-user-dir DOCUMENTS)/WeChat_Data"
WECHAT_FILES_DIR="${WECHAT_DATA_DIR}/xwechat_files"
WECHAT_HOME_DIR="${WECHAT_DATA_DIR}/home"

if [ -z ${QT_IM_MODULE} ]; then
	BWRAP_ENV_APPEND="${BWRAP_ENV_APPEND} --setenv QT_IM_MODULE fcitx"
fi

case "$XDG_CURRENT_DESKTOP" in 
	KDE)
	SCALE_FACTOR=$(kreadconfig6 --group KScreen --key ScaleFactor --default 1.0)
	BWRAP_ENV_APPEND="${BWRAP_ENV_APPEND} --setenv QT_SCALE_FACTOR ${SCALE_FACTOR}"
	;;
	*)
	BWRAP_ENV_APPEND="${BWRAP_ENV_APPEND} --setenv QT_AUTO_SCREEN_SCALE_FACTOR ${QT_AUTO_SCREEN_SCALE_FACTOR:-1}"
	;;
esac

if [ -z ${GTK_USE_PORTAL} ]; then
	BWRAP_ENV_APPEND="${BWRAP_ENV_APPEND} --setenv GTK_USE_PORTAL 1"
fi

mkdir -p "${WECHAT_FILES_DIR}" "${WECHAT_HOME_DIR}"
ln -sf "${WECHAT_FILES_DIR}" "${WECHAT_HOME_DIR}/xwechat_files"

exec bwrap \
	--dev-bind / / \
	--bind "${WECHAT_HOME_DIR}" "${HOME}" \
	--bind "${WECHAT_FILES_DIR}"{,} \
	--ro-bind-try "${HOME}/.fontconfig"{,} \
	--ro-bind-try "${HOME}/.fonts"{,} \
	--ro-bind-try "${HOME}/.config/fontconfig"{,} \
	--ro-bind-try "${HOME}/.local/share/fonts"{,} \
	--ro-bind {/usr/share/wechat-uos,}/var/ \
	--ro-bind {/usr/share/wechat-uos,}/etc/os-release \
	--ro-bind {/usr/share/wechat-uos,}/etc/lsb-release \
	--ro-bind-try /usr/lib/snapd-xdg-open/xdg-open /usr/bin/xdg-open \
	--ro-bind-try /usr/lib/flatpak-xdg-utils/xdg-open /usr/bin/xdg-open \
	${BWRAP_ENV_APPEND} \
	/opt/wechat-beta/wechat $@
