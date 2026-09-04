#!/bin/bash
#
# wechat-universal.sh - wrapper for WeChat Universal
# Copyright (C) 2024 Guoxin "7Ji" Pu <pugokushin@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
#

dbus_call() { # $1: dest, $2: object path, $3: method
    local args=(dbus-send --session --dest="$1" --print-reply "${@:2}")
    echo "D-Bus calling with: ${args[@]}" >&2
    "${args[@]}"
}

# Based on: https://github.com/web1n/wechat-universal-flatpak/blob/91f5d0d246881077812881e800a22f5a02cea438/wechat.sh#L3
notifier_get() {
    local dbus_item
    for dbus_item in $(
        dbus_call org.freedesktop.DBus /org/freedesktop/DBus org.freedesktop.DBus.ListNames |
            sed -n 's/      string "\(org\.kde\.StatusNotifierItem.\+\)"/\1/p'
    )
    do
        if dbus_call "${dbus_item}" \
                /StatusNotifierItem \
                org.freedesktop.DBus.Properties.Get \
                string:org.kde.StatusNotifierItem \
                string:Id |
            grep -q 'string "wechat"'
        then
            echo "${dbus_item}"
            return
        fi
    done
}

try_move_foreground() {
    # Try to find existing WeChat window first and display it, before actually opening a new one
    notifier_item=$(notifier_get)
    if [[ "${notifier_item}" ]]; then
        echo 'WeChat is already running, moving it to foreground'
        # Based on: https://github.com/web1n/wechat-universal-flatpak/blob/91f5d0d246881077812881e800a22f5a02cea438/wechat.sh#L25
        dbus_call "${notifier_item}" \
            /StatusNotifierItem \
            org.kde.StatusNotifierItem.Activate \
            int32:0 \
            int32:0
        return $?
    fi
    return 1
}

try_start() {
    # Data folder setup
    # If user has declared a custom data dir, no need to query xdg for documents dir, but always resolve that to absolute path
    if [[ "${WECHAT_DATA_DIR}" ]]; then
        WECHAT_DATA_DIR=$(readlink -f -- "${WECHAT_DATA_DIR}")
    else
        XDG_DOCUMENTS_DIR="${XDG_DOCUMENTS_DIR:-$(xdg-user-dir DOCUMENTS)}"
        if [[ -z "${XDG_DOCUMENTS_DIR}" ]]; then
            echo 'Error: Failed to get XDG_DOCUMENTS_DIR, refuse to continue'
            exit 1
        fi
        WECHAT_DATA_DIR="${XDG_DOCUMENTS_DIR}/WeChat_Data"
    fi
    echo "Using '${WECHAT_DATA_DIR}' as WeChat Data folder"
    WECHAT_FILES_DIR="${WECHAT_DATA_DIR}/xwechat_files"
    WECHAT_HOME_DIR="${WECHAT_DATA_DIR}/home"

    # Runtime folder setup
    XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-$(xdg-user-dir RUNTIME)}"
    if [[ -z "${XDG_RUNTIME_DIR}" ]]; then
        echo 'Error: Failed to get XDG_RUNTIME_DIR, refuse to continue'
        exit 1
    fi
    if [[ -z "${XAUTHORITY}" ]]; then
        echo 'Warning: No XAUTHORITY set, runnning in no-X environment? Generating it'
        export XAUTHORITY=$(mktemp "${XDG_RUNTIME_DIR}"/xauth_XXXXXX)
        echo "Info: Generated XAUTHORITY at '${XAUTHORITY}'"
    fi

    # wechat-universal only supports xcb
    export QT_QPA_PLATFORM=xcb \
        QT_AUTO_SCREEN_SCALE_FACTOR=1 \
        PATH="/sandbox:${PATH}"

    if [[ -z "${WECHAT_IME_WORKAROUND}" || "${WECHAT_IME_WORKAROUND}" == 'auto' ]]; then
        case "${XMODIFIERS}" in 
            *@im=fcitx*)
                WECHAT_IME_WORKAROUND='fcitx'
                ;;
            *@im=ibus*)
                WECHAT_IME_WORKAROUND='ibus'
                ;;
        esac
    fi

    case "${WECHAT_IME_WORKAROUND}" in
        fcitx)
            echo "IME workaround for fcitx applied"
            export QT_IM_MODULE=fcitx \
                GTK_IM_MODULE=fcitx
            ;;
        ibus)
            echo "IME workaround for ibus applied"
            export QT_IM_MODULE=ibus \
                GTK_IM_MODULE=ibus \
                IBUS_USE_PORTAL=1
            ;;
    esac

    BWRAP_DEV_BINDS=()
    for DEV_NODE in /dev/{nvidia{-uvm,ctl,*[0-9]},video*[0-9]}; do
        [[ -e "${DEV_NODE}" ]] && BWRAP_DEV_BINDS+=(--dev-bind "${DEV_NODE}"{,})
    done

    # Custom exposed folders
    # echo "Hint: Custom binds could either be declared in '~/.config/wechat-universal/binds.list', each line a path, absolute or relative to your HOME; or as argument \`--bind [custom bind]\`"
    BWRAP_CUSTOM_BINDS=()
    if [[ -f "${WECHAT_CUSTOM_BINDS_CONFIG}" ]]; then
        mapfile -t WECHAT_CUSTOM_BINDS_PRESISTENT < "${WECHAT_CUSTOM_BINDS_CONFIG}"
    fi
    cd ~ # 7Ji: two chdir.3 should be cheaper than a lot of per-dir calculation
    for WECHAT_CUSTOM_BIND in  "${WECHAT_CUSTOM_BINDS_RUNTIME[@]}" "${WECHAT_CUSTOM_BINDS_PRESISTENT[@]}"; do
        WECHAT_CUSTOM_BIND=$(readlink -f -- "${WECHAT_CUSTOM_BIND}")
        echo "Custom bind: '${WECHAT_CUSTOM_BIND}'"
        BWRAP_CUSTOM_BINDS+=(--bind "${WECHAT_CUSTOM_BIND}"{,})
    done
    cd - > /dev/null

    DBUS_SESSION_BUS_PATH=''
    if [[ "${DBUS_SESSION_BUS_ADDRESS}" ]]; then
        DBUS_SESSION_BUS_PATH=$(echo "${DBUS_SESSION_BUS_ADDRESS}" | sed 's/^unix:\(.\+=.\+\)\?path=\(.\+\)\(,.\+=.\+\|$\)/\2/')
    fi
    if [[ -z "${DBUS_SESSION_BUS_PATH}" ]]; then
        DBUS_SESSION_BUS_PATH="${XDG_RUNTIME_DIR}/bus"
        echo "Failed to extract \$DBUS_SESSION_BUS_ADDRESS from \$DBUS_SESSION_BUS_ADDRESS (${DBUS_SESSION_BUS_ADDRESS}), using fallback ${DBUS_SESSION_BUS_PATH}"
    fi

    mkdir -p "${WECHAT_FILES_DIR}" "${WECHAT_HOME_DIR}"
    ln -snf "${WECHAT_FILES_DIR}" "${WECHAT_HOME_DIR}/xwechat_files"

    BWRAP_ARGS+=(
        --unshare-user-try
        --unshare-pid
        --unshare-uts
        --unshare-cgroup-try
        --cap-drop ALL
        --die-with-parent

        # /usr
        --ro-bind /usr{,}
        --symlink usr/lib /lib
        --symlink usr/lib /lib64
        --symlink usr/bin /bin
        --symlink usr/bin /sbin
        --bind /usr/bin/{true,lsblk}

        # /sandbox
        --ro-bind /{usr/lib/flatpak-xdg-utils,sandbox}/xdg-open
        --ro-bind /usr/lib/wechat-universal/common.sh /sandbox/dde-file-manager

        # /dev
        --dev /dev
        --dev-bind /dev/dri{,}
        --tmpfs /dev/shm

        # /proc
        --proc /proc

        # /etc
        --ro-bind /etc/machine-id{,}
        --ro-bind /etc/passwd{,}
        --ro-bind /etc/nsswitch.conf{,}
        --ro-bind /etc/resolv.conf{,}
        --ro-bind /etc/localtime{,}
        --ro-bind-try /etc/fonts{,}

        # /sys
        --dir /sys/dev # hack for Intel / AMD graphics, mesa calling virtual nodes needs /sys/dev being 0755
        --ro-bind /sys/dev/char{,}
        --ro-bind /sys/devices{,}

        # /tmp
        --tmpfs /tmp
        --ro-bind-try /tmp/.X11-unix{,} # haayuya suggested this fix on Hyprland: [1] https://aur.archlinux.org/packages/wechat-universal-bwrap#comment-1046129 [2] https://github.com/hyprwm/Hyprland/pull/8874

        # /opt
        --ro-bind /opt/wechat-universal{,}
        --ro-bind-try /opt/lol{,} # Loong Old World (WeChat) on Loong New World (LoongArchLinux)

        # license fixups in various places
        --ro-bind {/usr/lib/wechat-universal,}/usr/lib/license
        --ro-bind {/usr/lib/wechat-universal,}/etc/lsb-release

        # /home
        --bind "${WECHAT_HOME_DIR}" "${HOME}"
        --bind "${WECHAT_FILES_DIR}"{,}
        --bind-try "${HOME}/.pki"{,}
        --ro-bind-try "${HOME}/.fontconfig"{,}
        --ro-bind-try "${HOME}/.fonts"{,}
        --ro-bind-try "${HOME}/.config/fontconfig"{,}
        --ro-bind-try "${HOME}/.local/share/fonts"{,}
        --ro-bind-try "${HOME}/.icons"{,}
        --ro-bind-try "${HOME}/.local/share/icons"{,}

        # /run
        --dev-bind /run/dbus{,}
        --ro-bind-try /run/systemd/userdb{,}
        --ro-bind-try "${XAUTHORITY}"{,}
        --ro-bind "${DBUS_SESSION_BUS_PATH}"{,}
        --ro-bind "${XDG_RUNTIME_DIR}/pulse"{,}
    )

    case "${WECHAT_MULTIPLE_INSTANCE}" in
    '')
        # Single
        :
        ;;
    'auto')
        # Multiple: tmpfs throwaway
        echo "Multiple instance: using throwaway tmpfs data dir"
        BWRAP_ARGS+=(
            --tmpfs "${HOME}/.xwechat"
            --tmpfs "${WECHAT_FILES_DIR}/all_users"
            --tmpfs "${WECHAT_FILES_DIR}/WMPF"
        )
        ;;
    *)
        # Multiple: persistent
        local INSTANCE_DATA_DIR=$(echo -n "${WECHAT_MULTIPLE_INSTANCE}" | md5sum)
        INSTANCE_DATA_DIR="${INSTANCE_DATA_DIR::32}"
        echo "Multiple instance: name '${WECHAT_MULTIPLE_INSTANCE}' => id '${INSTANCE_DATA_DIR}'"
        INSTANCE_DATA_DIR="${WECHAT_HOME_DIR}/.multi_xwechat_instance/${INSTANCE_DATA_DIR}"
        echo "Multiple instance: data dir is at '${INSTANCE_DATA_DIR}'"
        mkdir -p "${INSTANCE_DATA_DIR}"/{.xwechat,xwechat_files/all_users/config,xwechat_files/WMPF}
        BWRAP_ARGS+=(
            --bind "${INSTANCE_DATA_DIR}/.xwechat" "${HOME}/.xwechat"
            --bind "${INSTANCE_DATA_DIR}/xwechat_files/all_users" "${WECHAT_FILES_DIR}/all_users"
            --bind "${INSTANCE_DATA_DIR}/xwechat_files/WMPF" "${WECHAT_FILES_DIR}/WMPF"
        )
        ;;
    esac

    exec bwrap "${BWRAP_ARGS[@]}" "${BWRAP_CUSTOM_BINDS[@]}" "${BWRAP_DEV_BINDS[@]}" /opt/wechat-universal/wechat "$@"
    echo "Error: Failed to exec bwrap, rerun this script with 'bash -x $0' to show the full command history"
    return 1
}

applet_start() {
    IFS=':' read -r -a WECHAT_CUSTOM_BINDS_RUNTIME <<< "${WECHAT_CUSTOM_BINDS}"
    if [[ -z "${WECHAT_CUSTOM_BINDS_CONFIG}" && ! -v WECHAT_CUSTOM_BINDS_CONFIG ]]; then
        WECHAT_CUSTOM_BINDS_CONFIG=~/.config/wechat-universal/binds.list
    fi
    # Parsing arguments, for any option, argument > environment
    while (( $# )); do
        case "$1" in
        '--data')
            WECHAT_DATA_DIR="$2"
            shift
            ;;
        '--bind')
            WECHAT_CUSTOM_BINDS_RUNTIME+=("$2")
            shift
            ;;
        '--binds-config')
            WECHAT_CUSTOM_BINDS_CONFIG="$2"
            shift
            ;;
        '--ime')
            WECHAT_IME_WORKAROUND="$2"
            shift
            ;;
        '--no-callout')
            WECHAT_NO_CALLOUT='yes'
            ;;
        '--multiple')
            WECHAT_NO_CALLOUT='yes'
            case "$2" in
            ''|'auto')
                WECHAT_MULTIPLE_INSTANCE='auto'
                shift
                ;;
            --*)
                WECHAT_MULTIPLE_INSTANCE='auto'
                ;;
            *)
                WECHAT_MULTIPLE_INSTANCE="$2"
                shift
                ;;
            esac
            ;;
        '--help')
            if [[ "${LANG}" == zh_CN* ]]; then
                echo "$0 (--data [微信数据文件夹]) (--bind [自定义绑定挂载] (--bind ...))) (--ime [输入法]) (--help)"
                echo
                printf '    --%s\t%s\n' \
                    'data [微信数据文件夹]' '微信数据文件夹的路径，绝对路径，或相对于用户HOME的相对路径。 默认：~/文档/Wechat_Data；环境变量: WECHAT_DATA_DIR' \
                    'bind [自定义绑定挂载]' '自定义的绑定挂载，可被声明多次，绝对路径，或相对于用户HOME的相对路径。环境变量: WECHAT_CUSTOM_BINDS, （用冒号:分隔，与PATH相似）' \
                    'binds-config [文件]' '以每行一个的方式列明应被绑定挂载的路径的纯文本配置文件，每行定义与--bind一致。默认：~/.config/wechat-universal/binds.list；环境变量：WECHAT_CUSTOM_BINDS_CONFIG' \
                    'ime [输入法名称或特殊值]' '应用输入法对应环境变量修改，可支持：fcitx (不论是否为5), ibus，特殊值：none不应用，auto自动判断。默认: auto；环境变量: WECHAT_IME_WORKAROUND'\
                    'no-callout        ' '不要试图呼出已经在运行的微信实例。默认: 不设置；环境变量: WECHAT_NO_CALLOUT'\
                    'multiple [name]   ' '创建全新的微信实例，命名为[name]，即使微信已在运行，从而进行多开；强制启用--no-callout。特殊值：留空（仅参数）或auto生成一次性tmpfs数据文件夹；环境变量: WECHAT_MULTIPLE_INSTANCE'\
                    'help' ''
                echo
                echo "命令行参数比环境变量优先级更高，如果命令行参数与环境变量皆为空，则使用默认值"
            else
                echo "$0 (--data [wechat data]) (--bind [custom bind] (--bind ...))) (--ime [ime]) (--help)"
                echo
                printf '    --%s\t%s\n' \
                    'data [wechat data]' 'Path to Wechat_Data folder, absolute or relative to user home, default: ~/Documents/Wechat_Data, as environment: WECHAT_DATA_DIR' \
                    'bind [custom bind]' 'Custom bindings, could be specified multiple times, absolute or relative to user home, as environment: WECHAT_CUSTOM_BINDS (colon ":" separated like PATH)' \
                    'binds-config [file]' 'Path to text file that contains one --bind value per line, default: ~/.config/wechat-universal/binds.list, as environment: WECHAT_CUSTOM_BINDS_CONFIG'\
                    'ime [input method]' 'Apply IME-specific workaround, support: fcitx (also for 5), ibus, default: auto, as environment: WECHAT_IME_WORKAROUND'\
                    'no-callout        ' 'do not try to call out an already running WeChat instance. default: not set, as environment: WECHAT_NO_CALLOUT'\
                    'multiple [name]' 'Create a new, individual instance even if WeChat is already running, naming it as [name], useful when you want to keep multiple WeChat accounts online on a single host, enables --no-callout implicitly. special: (leave empty as argument or) auto, to generate the data dir in a throwaway tmpfs. default: not set, as environment: WECHAT_MULTIPLE_INSTANCE'\
                    'help' ''
                echo
                echo "Arguments take priority over environment, if both argument and environment are empty, the default value would be used"
            fi
            return 0
            ;;
        *)
            echo "Unknown option: $1, pass --help to read help message"
            return 1
            ;;
        esac
        shift
    done
    if [[ -z "${WECHAT_NO_CALLOUT}" ]] && try_move_foreground; then
        return 0
    else
        try_start "$@"
        return $?
    fi
}

applet_stop() {
    notifier_item=$(notifier_get)
    [[ -z "${notifier_item}" ]] && return
    echo 'Stopping running WeChat instance'
    # Based on: https://github.com/web1n/wechat-universal-flatpak/blob/91f5d0d246881077812881e800a22f5a02cea438/wechat.sh#L35
    dbus_call "${notifier_item}" \
        /MenuBar \
        com.canonical.dbusmenu.Event \
        int32:1 \
        string:clicked \
        variant:string:'Quit WeChat' \
        uint32:0
}

applet_dde() {
    local item=
    while (( $# )); do
        case "$1" in 
        '--show-item')
            item="$2"
            shift
            ;;
        esac
        shift
    done
    if [[ "${item}" ]]; then
        local path object target
        path=$(readlink -f -- "${item}") # Resolve this to absolute path that's same across host / guest
        echo "Fake deepin file manager: dbus-send to open '${path}' in file manager"
        if [[ -d "${path}" ]]; then
            # WeChat pass both files and folders in the same way, if we use ShowItems for folders,
            # it would open that folder's parent folder, which is not right.
            object=ShowFolders
            target=folders
        else
            object=ShowItems
            target=items
        fi
        exec dbus-send --print-reply --dest=org.freedesktop.FileManager1 \
            /org/freedesktop/FileManager1 \
            org.freedesktop.FileManager1."${object}" \
            array:string:"file://${path}" \
            string:fake-dde-file-manager-show-"${target}"
        # We should not fall to here, but add a fallback anyway
        echo "Fake deepin file manager: fallback: xdg-open to show '${path}' in file manager"
        exec xdg-open "${path}"
    else
        echo "Fake deepin file manager: xdg-open with args $@"
        exec xdg-open "$@"
    fi
    # At this stage, it's either: dbus-send not found, or xdg-open not found, this should not happen
    # In whatever case, bail out
    echo "Fake deepin file manager: could not open any thing, original args: $@"
    return 1
}

applet="${0##*/}"
case "${applet}" in
    'stop.sh'|'stop')
        applet_stop "$@"
        ;;
    'start.sh'|'start'|'wechat-universal.sh'|'wechat-universal')
        applet_start "$@"
        ;;
    'dde-file-manager')
        applet_dde "$@"
        ;;
    *)
        echo "Unknown applet '${applet}', allowed: start.sh (alias start, wechat-universal, wechat-universal.sh), stop.sh (alias stop)"
        false
        ;;
esac
exit $?
