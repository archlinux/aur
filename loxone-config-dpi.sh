#!/bin/bash
export WINEPREFIX="${XDG_DATA_HOME:-${HOME}/.local/share}/loxone-config/wine"
export WINEDEBUG=-all

if [[ ! -d "${WINEPREFIX}/drive_c" ]]; then
    zenity --error --title="Loxone Config Scaling" \
        --text="Loxone Config has not been started yet.\nPlease run 'loxone-config' once first." \
        2>/dev/null
    exit 1
fi

_current_logpixels=$(wine reg query "HKCU\Control Panel\Desktop" /v LogPixels 2>/dev/null \
    | awk '/LogPixels/ {print strtonum($NF)}')
_current_percent=$(( (${_current_logpixels:-96} * 100 + 48) / 96 ))

_percent=$(zenity --list --radiolist \
    --title="Loxone Config Scaling" \
    --text="Select the display scaling for Loxone Config (applies after restarting the app):" \
    --column="" --column="Scaling" --column="" \
    --hide-column=3 --print-column=3 \
    $([[ "${_current_percent}" -eq 100 ]] && echo TRUE || echo FALSE) "100%" 100 \
    $([[ "${_current_percent}" -eq 125 ]] && echo TRUE || echo FALSE) "125%" 125 \
    $([[ "${_current_percent}" -eq 150 ]] && echo TRUE || echo FALSE) "150%" 150 \
    $([[ "${_current_percent}" -eq 175 ]] && echo TRUE || echo FALSE) "175%" 175 \
    $([[ "${_current_percent}" -eq 200 ]] && echo TRUE || echo FALSE) "200%" 200 \
    2>/dev/null)

[[ -z "${_percent}" ]] && exit 0

_logpixels=$(( (96 * _percent + 50) / 100 ))
wine reg add "HKCU\Control Panel\Desktop" /v LogPixels /t REG_DWORD /d "${_logpixels}" /f &>/dev/null

zenity --info --title="Loxone Config Scaling" \
    --text="Scaling set to ${_percent}%.\nPlease restart Loxone Config for the change to take effect." \
    2>/dev/null
