#!/bin/bash
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

env_add() {
    BWRAP_ENV_APPEND+=(--setenv "$1" "$2")
}
BWRAP_ENV_APPEND=()
# wechat-universal only supports xcb
env_add QT_QPA_PLATFORM xcb
env_add QT_AUTO_SCREEN_SCALE_FACTOR 1
env_add PATH "/sandbox:${PATH}"

case "${XMODIFIERS}" in 
    *@im=fcitx*)
        echo "Workaround for fcitx applied"
        env_add QT_IM_MODULE fcitx
        env_add GTK_IM_MODULE fcitx    
        ;;
    *@im=ibus*)
        echo "Workaround for ibus applied"
        env_add QT_IM_MODULE ibus
        env_add GTK_IM_MODULE ibus
        env_add IBUS_USE_PORTAL 1
        ;;
esac

BWRAP_DEV_BINDS=()
for DEV_NODE in /dev/{nvidia{-uvm,ctl,*[0-9]},video*[0-9]}; do
    [[ -e "${DEV_NODE}" ]] && BWRAP_DEV_BINDS+=(--dev-bind "${DEV_NODE}"{,})
done

# Custom exposed folders
echo "Hint: Custom binds could be declared in '~/.config/wechat-universal/binds.list', each line a path, absolute or relative to your HOME"
BWRAP_CUSTOM_BINDS=()
while IFS='' read -r CUSTOM_BIND || [[ "${CUSTOM_BIND}" ]]; do
    CUSTOM_BIND=$(readlink -f -- "${CUSTOM_BIND}")
    echo "Custom bind: '${CUSTOM_BIND}'"
    BWRAP_CUSTOM_BINDS+=(--bind "${CUSTOM_BIND}"{,})
done < ~/.config/wechat-universal/binds.list

mkdir -p "${WECHAT_FILES_DIR}" "${WECHAT_HOME_DIR}"
ln -snf "${WECHAT_FILES_DIR}" "${WECHAT_HOME_DIR}/xwechat_files"

BWRAP_ARGS=(
    # Drop privileges
    --unshare-all
    --share-net
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
    --ro-bind /{usr/share/wechat-universal/usr/bin,sandbox}/dde-file-manager

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

    # /opt, Wechat-beta itself
    --ro-bind /opt/wechat-universal{,}

    # license fixups in various places
    --ro-bind {/usr/share/wechat-universal,}/usr/lib/license
    --ro-bind {/usr/share/wechat-universal,}/var/
    --ro-bind {/usr/share/wechat-universal,}/etc/os-release
    --ro-bind {/usr/share/wechat-universal,}/etc/lsb-release

    # /home
    --bind "${WECHAT_HOME_DIR}" "${HOME}"
    --bind "${WECHAT_FILES_DIR}"{,}
    --bind-try "${HOME}/.pki"{,}
    --ro-bind-try "${HOME}/.fontconfig"{,}
    --ro-bind-try "${HOME}/.fonts"{,}
    --ro-bind-try "${HOME}/.config/fontconfig"{,}
    --ro-bind-try "${HOME}/.local/share/fonts"{,}
    --ro-bind-try "${HOME}/.icons"{,}
    --ro-bind-try "${HOME}/.local/share/.icons"{,}

    # /run
    --dev-bind /run/dbus{,}
    --ro-bind /run/systemd/userdb{,}
    --ro-bind-try "${XAUTHORITY}"{,}
    --ro-bind "${XDG_RUNTIME_DIR}/bus"{,}
    --ro-bind "${XDG_RUNTIME_DIR}/pulse"{,}
)

exec bwrap "${BWRAP_ARGS[@]}" "${BWRAP_CUSTOM_BINDS[@]}" "${BWRAP_DEV_BINDS[@]}" "${BWRAP_ENV_APPEND[@]}" /opt/wechat-universal/wechat "$@"