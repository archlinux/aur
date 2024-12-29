#!/usr/bin/env sh

#workdir="${XDG_DATA_HOME:-"$HOME/.local/share"}/Grayjay"
# the app is not currently properly following the XDG standard
workdir="$HOME/.local/share/Grayjay"
appdir='/opt/grayjay'

mkdir -p "${workdir}"
cd "${workdir}"

ln -sf "${appdir}/wwwroot" "${workdir}/wwwroot"

exec /opt/grayjay/Grayjay "$@" 