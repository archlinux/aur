#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
_OPTIONS="@options@"
get_display_server() {
    if [ "${XDG_SESSION_TYPE}" = "wayland" ]; then
        echo "wayland"
    elif [ "${XDG_SESSION_TYPE}" = "x11" ]; then
        echo "x11"
    else
        # 尝试通过进程检查
        if pgrep -x Xorg >/dev/null; then
            echo "x11"
        elif pgrep -f wayland-server >/dev/null; then
            echo "wayland"
        else
            echo "unknown"
        fi
    fi
}
display_server="$(get_display_server)"
case "${display_server}" in
        wayland)
            exec env "${_OPTIONS}" "${_RUNNAME}" "$@"
            ;;
        x11)
            exec "${_RUNNAME}" "$@"
            ;;
        unknown)
            exec "${_RUNNAME}" "$@"
            ;;
esac