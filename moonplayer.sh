#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/bin/@runname@"
export PATH="${_APPDIR}:${_APPDIR}/bin+:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib+:${LD_LIBRARY_PATH}"
export QT_QPA_PLATFORM_PLUGIN_PATH="${_APPDIR}/plugins+:${QT_QPA_PLATFORM_PLUGIN_PATH}"
export QML_IMPORT_PATH="${_APPDIR}/qml+:${QML2_IMPORT_PATH}"
export QML2_IMPORT_PATH="${_APPDIR}/qml+:${QML2_IMPORT_PATH}"
case "${XDG_CURRENT_DESKTOP}" in
    *GNOME*|*gnome*|*XFCE*)
        export QT_QPA_PLATFORMTHEME=gtk2
        ;;
esac
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
exec "${_RUNNAME}" "$@" || exit $?