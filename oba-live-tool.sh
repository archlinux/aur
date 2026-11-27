#!/bin/bash
set -e
export _APPDIR="/usr/lib/@appname@" CHROME_DESKTOP="@appname@.desktop"
export LD_LIBRARY_PATH="${_APPDIR}/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
[[ "${ELECTRON_RUN_AS_NODE}" == "1" ]] && exec electron@electronversion@ "$@"
if [[ -f "${_APPDIR}/app.asar" ]]; then _RUNNAME="${_APPDIR}/app.asar"
elif [[ -d "${_APPDIR}/app" ]]; then _RUNNAME="${_APPDIR}/app"
else echo "${0##*/}: no application entry found in ${_APPDIR} (need app.asar or app/)" >&2; exit 1; fi
_SANDBOX_ARG=(); [[ "${EUID}" -eq 0 ]] && _SANDBOX_ARG=("--no-sandbox")
_ozone_var="${_APPDIR##*/}"; _ozone_var="${_ozone_var^^}"; _ozone_var="${_ozone_var//[^A-Z0-9_]/_}_OZONE_PLATFORM"
_OZONE_HINT="${!_ozone_var:-auto}"; _OZONE_ARG=()
case "${_OZONE_HINT}" in
	x11) _OZONE_ARG=("--ozone-platform=x11") ;;
	wayland) _OZONE_ARG=("--enable-features=UseOzonePlatform" "--ozone-platform=wayland") ;;
	auto) : ;;
	*) echo "${0##*/}: Unknown Ozone platform '${_OZONE_HINT}' (available: x11|wayland|auto), falling back to x11" >&2; _OZONE_ARG=("--ozone-platform=x11") ;;
esac
exec electron@electronversion@ "${_SANDBOX_ARG[@]}" "${_OZONE_ARG[@]}" --require "${_APPDIR}/@appname@.js" "${_RUNNAME}" "$@"