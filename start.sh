#!/bin/bash

USER_RUN_DIR="/run/user/$(id -u)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
FONTCONFIG_DIR="${CONFIG_DIR}/fontconfig"
QQ_APP_DIR="${CONFIG_DIR}/QQ"
DOWNLOAD_DIR="$(xdg-user-dir DOWNLOAD)"
NEW_DISPLAY="${DISPLAY}"
QQ_HOTUPDATE_DIR="${QQ_APP_DIR}/versions"
QQ_HOTUPDATE_VERSION="2.0.2-510"
QQ_PREVIOUS_VERSIONS=("2.0.1-429" "2.0.1-453")

if [ "${DOWNLOAD_DIR}" == "${HOME}" ]; then
    DOWNLOAD_DIR="${HOME}/Downloads"
    if [ ! -e "${DOWNLOAD_DIR}" ]; then mkdir -p "${DOWNLOAD_DIR}"; fi
fi
if [ ! -e "${QQ_APP_DIR}" ]; then mkdir -p "${QQ_APP_DIR}"; fi
if [ ! -e "${QQ_HOTUPDATE_DIR}/${QQ_HOTUPDATE_VERSION}" ]; then ln -sfd "/opt/QQ/resources/app" "${QQ_HOTUPDATE_DIR}/${QQ_HOTUPDATE_VERSION}"; fi

# 处理 config.json
if [ ! -f "${QQ_HOTUPDATE_DIR}/config.json" ]; then
    cp "/opt/QQ/workarounds/config.json" "${QQ_HOTUPDATE_DIR}/config.json"
else
    for VERSION in ${QQ_PREVIOUS_VERSIONS[@]}; do
        if [ ! -z "$(grep -z "${VERSION}" "${QQ_HOTUPDATE_DIR}/config.json")" ]; then
            cp "/opt/QQ/workarounds/config.json" "${QQ_HOTUPDATE_DIR}/config.json"
            break
        fi
    done
fi

bwrap --new-session --die-with-parent --cap-drop ALL --unshare-user-try --unshare-pid --unshare-cgroup-try \
    --symlink usr/lib /lib \
    --symlink usr/lib64 /lib64 \
    --symlink usr/bin /bin \
    --ro-bind /usr /usr \
    --ro-bind /opt/QQ /opt/QQ \
    --dev-bind /dev /dev \
    --ro-bind /sys /sys \
    --ro-bind /etc/resolv.conf /etc/resolv.conf \
    --ro-bind /etc/localtime /etc/localtime \
    --proc /proc \
    --dev-bind /run/dbus /run/dbus \
    --bind "${USER_RUN_DIR}" "${USER_RUN_DIR}" \
    --ro-bind-try /etc/fonts /etc/fonts \
    --ro-bind-try "${FONTCONFIG_DIR}" "${FONTCONFIG_DIR}" \
    --dev-bind /tmp /tmp \
    --bind-try "${HOME}/.pki" "${HOME}/.pki" \
    --ro-bind-try "${XAUTHORITY}" "${XAUTHORITY}" \
    --bind-try "${DOWNLOAD_DIR}" "${DOWNLOAD_DIR}" \
    --bind "${QQ_APP_DIR}" "${QQ_APP_DIR}" \
    --setenv IBUS_USE_PORTAL 1 \
    --setenv DISPLAY "${NEW_DISPLAY}" \
    /opt/QQ/qq "$@"

# 移除无用崩溃报告和日志
# 如果需要向腾讯反馈 bug，请注释掉如下两行
rm -rf "${QQ_APP_DIR}/crash_files"
rm -rf  "${QQ_APP_DIR}/nt_qq_"**"/nt_data/log/"*
