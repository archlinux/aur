#!/bin/bash
export WINEPREFIX="${XDG_DATA_HOME:-${HOME}/.local/share}/loxone-config/wine"
export WINEDEBUG=-all
_full_pkgver=$(</opt/loxone-config-bin/VERSION)
_pkgver="${_full_pkgver%-*}"

mkdir -p "${WINEPREFIX}"

if [[ ! -d "${WINEPREFIX}/drive_c" ]]; then
    wineboot --init 2>/dev/null
fi

_loxone_winpath="${WINEPREFIX}/drive_c/Program Files (x86)/Loxone/LoxoneConfig"
if [[ ! -e "${_loxone_winpath}" ]]; then
    mkdir -p "${WINEPREFIX}/drive_c/Program Files (x86)/Loxone"
    ln -s /opt/loxone-config-bin "${_loxone_winpath}"
fi

# Re-copy whenever the installed package version changes (including pkgrel-only
# bumps), so packaging fixes to ProgramData reach existing installations
_progdata="${WINEPREFIX}/drive_c/ProgramData/Loxone/Loxone Config ${_pkgver}"
_progdata_stamp="${WINEPREFIX}/.loxone-config-bin-version"
if [[ ! -d "${_progdata}" ]] || [[ "$(cat "${_progdata_stamp}" 2>/dev/null)" != "${_full_pkgver}" ]]; then
    mkdir -p "${_progdata}"
    cp -r /opt/loxone-config-bin/programdata/. "${_progdata}/"
    echo -n "${_full_pkgver}" > "${_progdata_stamp}"
fi

exec wine "C:\\Program Files (x86)\\Loxone\\LoxoneConfig\\LoxoneMonitor.exe" "$@"
