#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
gsettings get org.gnome.desktop.interface gtk-theme 2> /dev/null | grep -qi "dark" && GTK_THEME_VARIANT="dark" || GTK_THEME_VARIANT="light"
APP_GTK_THEME="${APP_GTK_THEME:-"Adwaita:$GTK_THEME_VARIANT"}"
export GTK_DATA_PREFIX="${_APPDIR}"
export GTK_THEME="${APP_GTK_THEME}"
export GDK_BACKEND=x11
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
exec "${_RUNNAME}" "$@" || exit $?