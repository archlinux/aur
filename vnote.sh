#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/bin/@runname@"
export PATH="${_APPDIR}/bin:${PATH}"
if [ -x "/usr/bin/fcitx" ];then
    export QT_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx
fi
export LD_LIBRARY_PATH="${_APPDIR}/lib:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/plugins:${QT_PLUGIN_PATH}"
case "${XDG_CURRENT_DESKTOP}" in
    *GNOME*|*gnome*|*XFCE*)
        export QT_QPA_PLATFORMTHEME=gtk2
        ;;
esac
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
exec "${_RUNNAME}" "$@" || exit $?