#!/bin/bash

QQ_HOTUPDATE_VERSION="__CURRENT_VER__"

function command_exists() {
    local command="$1"
    command -v "${command}" >/dev/null 2>&1
}

function show_error_dialog() {
    title="linuxqq-nt-bwrap"
    if command_exists kdialog; then
        kdialog --error "$1" --title "$title" --icon qq
    elif command_exists zenity; then
        zenity --error --title "$title" --icon-name qq --text "$1"
    else
        all_off="$(tput sgr0)"
        bold="${all_off}$(tput bold)"
        blue="${bold}$(tput setaf 4)"
        yellow="${bold}$(tput setaf 3)"
        printf "${blue}==>${yellow} ${bold} $1${all_off}\n"
    fi
}

# 进行必要文件的检查
if [ ! -e "/etc/localtime" ]; then
    show_error_dialog "/etc/localtime 未找到。\n请先设置系统时区。"
    exit 1
fi

USER_RUN_DIR="/run/user/$(id -u)"
XAUTHORITY="${XAUTHORITY:-$HOME/.Xauthority}"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
FONTCONFIG_HOME="${XDG_CONFIG_HOME}/fontconfig"
QQ_APP_DIR="${XDG_CONFIG_HOME}/QQ"
if [ -z "${QQ_DOWNLOAD_DIR}" ]; then
    if [ -z "${XDG_DOWNLOAD_DIR}" ]; then
        XDG_DOWNLOAD_DIR="$(xdg-user-dir DOWNLOAD)"
    fi
    QQ_DOWNLOAD_DIR="${XDG_DOWNLOAD_DIR:-$HOME/Downloads}"
fi

# 从 flags 文件中加载参数

set -euo pipefail
flags_file="${XDG_CONFIG_HOME}/qq-electron-flags.conf"
declare -a flags

if [[ -f "${flags_file}" ]]; then
    mapfile -t <"${flags_file}"
fi

for line in "${MAPFILE[@]}"; do
    if [[ ! "${line}" =~ ^[[:space:]]*#.* ]]; then
        flags+=("${line}")
    fi
done

QQ_HOTUPDATE_DIR="${QQ_APP_DIR}/versions"

# 在「下载」目录不存在的时候，自动使用 ~/Downloads
# 避免挂载整个 home
if [ "${QQ_DOWNLOAD_DIR%*/}" == "${HOME}" ]; then
    QQ_DOWNLOAD_DIR="${HOME}/Downloads"
fi

# 安装当前版本
HOTUPDATE_VERSION_DIR="${QQ_HOTUPDATE_DIR}/${QQ_HOTUPDATE_VERSION}"
install -d "${QQ_HOTUPDATE_DIR}"
if [ ! -d "${HOTUPDATE_VERSION_DIR}" ] && [ ! -L "${HOTUPDATE_VERSION_DIR}" ]; then
    ln -sfd "/opt/QQ/resources/app" "${HOTUPDATE_VERSION_DIR}"
fi

# 处理旧版本
rm -rf "${QQ_HOTUPDATE_DIR}/"**".zip"
is_hotupdated_version=0  # 正在运行的版本是否经过热更新？

find "${QQ_HOTUPDATE_DIR}/"*-* -maxdepth 1 -type "d,l" | while read path; do
    this_version="$(basename "$path")"
    if [ "$(vercmp "${this_version}" "${QQ_HOTUPDATE_VERSION//_/-}")" -lt "0" ]; then
        # 这个版本小于当前版本，删除之
        echo "rm $this_version"
        rm -rf "$path"
    else
        is_hotupdated_version=1
    fi
done

if [ "$is_hotupdated_version" == "0" ]; then
    cp "/opt/QQ/workarounds/config.json" "${QQ_HOTUPDATE_DIR}/config.json"
fi

bwrap --new-session --cap-drop ALL --unshare-user-try --unshare-pid --unshare-cgroup-try \
    --symlink usr/lib /lib \
    --symlink usr/lib64 /lib64 \
    --symlink usr/bin /bin \
    --ro-bind /usr /usr \
    --ro-bind /opt /opt \
    --ro-bind /opt/QQ/workarounds/xdg-open.sh /usr/bin/xdg-open \
    --ro-bind /usr/lib/snapd-xdg-open/xdg-open /snapd-xdg-open \
    --ro-bind /usr/lib/flatpak-xdg-utils/xdg-open /flatpak-xdg-open \
    --ro-bind /etc/machine-id /etc/machine-id \
    --dev-bind /dev /dev \
    --ro-bind /sys /sys \
    --ro-bind /etc/passwd /etc/passwd \
    --ro-bind /etc/nsswitch.conf /etc/nsswitch.conf \
    --ro-bind-try /run/systemd/userdb /run/systemd/userdb \
    --ro-bind /etc/resolv.conf /etc/resolv.conf \
    --ro-bind /etc/localtime /etc/localtime \
    --proc /proc \
    --dev-bind /run/dbus /run/dbus \
    --bind "${USER_RUN_DIR}" "${USER_RUN_DIR}" \
    --ro-bind-try /etc/fonts /etc/fonts \
    --dev-bind /tmp /tmp \
    --bind-try "${HOME}/.pki" "${HOME}/.pki" \
    --ro-bind-try "${XAUTHORITY}" "${XAUTHORITY}" \
    --bind-try "${QQ_DOWNLOAD_DIR}" "${QQ_DOWNLOAD_DIR}" \
    --bind "${QQ_APP_DIR}" "${QQ_APP_DIR}" \
    --ro-bind-try "${FONTCONFIG_HOME}" "${FONTCONFIG_HOME}" \
    --ro-bind-try "${HOME}/.icons" "${HOME}/.icons" \
    --ro-bind-try "${HOME}/.local/share/.icons" "${HOME}/.local/share/.icons" \
    --ro-bind-try "${XDG_CONFIG_HOME}/gtk-3.0" "${XDG_CONFIG_HOME}/gtk-3.0" \
    --ro-bind /etc/nsswitch.conf /etc/nsswitch.conf \
    --ro-bind /run/systemd/userdb/ /run/systemd/userdb/ \
    --setenv IBUS_USE_PORTAL 1 \
    --setenv QQNTIM_HOME "${QQ_APP_DIR}/QQNTim" \
    --setenv LITELOADERQQNT_PROFILE "${QQ_APP_DIR}/LiteLoaderQQNT" \
    /opt/QQ/electron "${flags[@]}" "$@" /opt/QQ/resources/app

# 移除无用崩溃报告和日志
# 如果需要向腾讯反馈 bug，请注释掉如下几行
rm -rf ${QQ_APP_DIR}/crash_files
touch ${QQ_APP_DIR}/crash_files
if [ -d "${QQ_APP_DIR}/log" ]; then
    rm -rf "${QQ_APP_DIR}/log"
fi
for nt_qq_userdata in "${QQ_APP_DIR}/nt_qq_"*; do
    if [ -d "${nt_qq_userdata}/log" ]; then
        rm -rf "${nt_qq_userdata}/log"
    fi
    if [ -d "${nt_qq_userdata}/log-cache" ]; then
        rm -rf "${nt_qq_userdata}/log-cache"
    fi
done
if [ -d "${QQ_APP_DIR}/Crashpad" ]; then
    rm -rf "${QQ_APP_DIR}/Crashpad"
fi
