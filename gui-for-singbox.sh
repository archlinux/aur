#!/bin/bash

LIB_DIR=/usr/lib/gui-for-singbox
binary=GUI.for.SingBox
config_root=${XDG_CONFIG_HOME:-$HOME/.config}
[[ $config_root == /* ]] || config_root="$HOME/.config"
preference="$config_root/gui-for-singbox/cpu"
warning='Unless you understand CPU instruction sets, keep Automatic.'
fail() { printf '%s\n' "$*" >&2; exit 1; }

host=$(uname -m) || exit 1
[[ -x $LIB_DIR/$binary ]] || fail 'The packaged GUI executable is missing.'
case "$host" in
    aarch64) automatic=arm64 ;;
    x86_64)
        automatic=v1
        if [[ -x $LIB_DIR/$binary-v3 ]]; then
            caps=$(LC_ALL=C /usr/lib/ld-linux-x86-64.so.2 --help 2>/dev/null) || caps=''
            while read -r level status; do
                if [[ $level == x86-64-v3 && $status == '(supported, searched)' ]]; then
                    automatic=v3
                    break
                fi
            done <<< "$caps"
        fi
        ;;
    *) fail "Unsupported CPU architecture: $host" ;;
esac

compatible() {
    case "$1" in
        auto) return 0 ;;
        v1) [[ $host == x86_64 ]] ;;
        v3) [[ $automatic == v3 ]] ;;
        arm64) [[ $host == aarch64 ]] ;;
        *) return 1 ;;
    esac
}

save_preference() (
    if [[ $1 == auto ]]; then
        rm -f -- "$preference" || exit 1
    else
        mkdir -p -- "${preference%/*}" || exit 1
        staged=$(mktemp "${preference%/*}/.cpu.XXXXXXXX") || exit 1
        trap 'rm -f -- "$staged"' EXIT
        printf '%s\n' "$1" > "$staged" && mv -fT -- "$staged" "$preference" || exit 1
    fi
    printf 'CPU preference: %s\n' "$1"
)

case ${1-} in
    --select-cpu|--cpu)
        if [[ $1 == --select-cpu ]]; then
            [[ $# == 1 ]] || fail 'Usage: gui-for-singbox --select-cpu'
            printf '%s\n' "$warning" '1) Automatic [default]' '2) x86-64 v1' '3) x86-64 v3' '4) ARM64' >&2
            printf 'Select a CPU build [Automatic]: ' >&2
            IFS= read -r choice || fail 'No selection was entered.'
            case "$choice" in ''|1) choice=auto ;; 2) choice=v1 ;; 3) choice=v3 ;; 4) choice=arm64 ;; esac
        else
            [[ $# == 2 ]] || fail 'Usage: gui-for-singbox --cpu auto|v1|v3|arm64'
            choice=$2
            [[ $choice == auto ]] || printf '%s\n' "$warning" >&2
        fi
        compatible "$choice" || fail 'Unavailable CPU build for this machine and package.'
        if [[ $choice != auto ]]; then
            printf 'Type yes to use %s: ' "$choice" >&2
            IFS= read -r answer && [[ $answer == yes ]] || fail 'CPU preference unchanged.'
        fi
        save_preference "$choice"
        exit $?
        ;;
esac

selected=$automatic
if [[ -e $preference || -L $preference ]]; then
    saved=''
    if [[ -f $preference && -r $preference ]]; then saved=$(< "$preference"); fi
    if compatible "$saved"; then
        [[ $saved == auto ]] || selected=$saved
    else
        printf 'Saved CPU preference is unavailable; using Automatic (%s).\n' "$automatic" >&2
    fi
fi
case ${1-} in
    --show-cpu)
        [[ $# == 1 ]] || fail 'Usage: gui-for-singbox --show-cpu'
        printf '%s\n' "$selected"
        exit 0
        ;;
    --) shift ;;
esac

# --- 1. Wayland & GTK 环境规范化 (仅作用于当前子进程，安全隔离) ---
export GTK_USE_PORTAL=1

if command -v gsettings >/dev/null 2>&1; then
    COLOR_SCHEME=$(gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null)
    if [[ "$COLOR_SCHEME" == *'prefer-dark'* ]]; then
        export GTK_THEME="${GTK_THEME:-Adwaita:dark}"
    fi
fi

# --- 2. 核心数据隔离逻辑 ---
APP_DIR="${HOME}/.local/share/GUI.for.SingBox"
CORE_DIR="${APP_DIR}/data/sing-box"

mkdir -p "${CORE_DIR}" || exit 1

source_binary="${LIB_DIR}/${binary}"
[[ $selected != v3 ]] || source_binary+="-v3"
cached_binary="${APP_DIR}/${binary}"
if [[ ! -x $cached_binary || -L $cached_binary ]] ||
    ! { exec {gui_fd}<"$cached_binary"; } 2>/dev/null ||
    ! cmp -s "$source_binary" "/proc/$$/fd/$gui_fd"; then
    staged=$(mktemp "${APP_DIR}/.${binary}.XXXXXXXX") || exit 1
    trap 'rm -f -- "$staged"' EXIT
    install -m755 "$source_binary" "$staged" || exit 1
    [[ -z ${gui_fd-} ]] || exec {gui_fd}<&-
    exec {gui_fd}<"$staged" || exit 1
    mv -fT -- "$staged" "$cached_binary" || exit 1
    trap - EXIT
fi
# Older packages cached the optimized executable under a second name.
if [[ -f "${APP_DIR}/GUI.for.SingBox-v3" || -L "${APP_DIR}/GUI.for.SingBox-v3" ]]; then
    rm -f -- "${APP_DIR}/GUI.for.SingBox-v3" || exit 1
fi

if [ ! -L "${CORE_DIR}/sing-box" ]; then
    ln -sf /usr/bin/sing-box "${CORE_DIR}/sing-box"
fi

cd "${APP_DIR}" || exit 1
# Execute exactly the verified inode even if another machine sharing HOME
# selects a different CPU build and refreshes the cache concurrently.
exec -a "$cached_binary" "/proc/self/fd/$gui_fd" "$@"
