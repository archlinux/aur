#!/bin/bash
export WINEPREFIX="${XDG_DATA_HOME:-${HOME}/.local/share}/loxone-config/wine"
export WINEDEBUG=-all
_pkgver=17.0.3.31

mkdir -p "${WINEPREFIX}"

if [[ ! -d "${WINEPREFIX}/drive_c" ]]; then
    wineboot --init 2>/dev/null
fi

_loxone_winpath="${WINEPREFIX}/drive_c/Program Files (x86)/Loxone/LoxoneConfig"
if [[ ! -e "${_loxone_winpath}" ]]; then
    mkdir -p "${WINEPREFIX}/drive_c/Program Files (x86)/Loxone"
    ln -s /opt/loxone-config-bin "${_loxone_winpath}"
fi

_progdata="${WINEPREFIX}/drive_c/ProgramData/Loxone/Loxone Config ${_pkgver}"
if [[ ! -d "${_progdata}" ]]; then
    mkdir -p "${_progdata}"
    cp -r /opt/loxone-config-bin/programdata/. "${_progdata}/"
fi

exec wine "C:\\Program Files (x86)\\Loxone\\LoxoneConfig\\LoxoneConfig.exe" "$@"
