#!/bin/bash
set -e
export _APPDIR="/usr/lib/@appname@"
export CHROME_DESKTOP="@appname@.desktop"
export LD_LIBRARY_PATH="${_APPDIR}/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
if [[ -f "${_APPDIR}/app.asar" ]]; then
	_RUNNAME="${_APPDIR}/app.asar"
elif [[ -d "${_APPDIR}/app" ]]; then
	_RUNNAME="${_APPDIR}/app"
elif [[ -d "${_APPDIR}/app.asar.unpacked" ]]; then
	_RUNNAME="${_APPDIR}/app.asar.unpacked"
else
	echo "${0##*/}: Cannot locate app entry in ${_APPDIR}" >&2
	exit 1
fi
_SANDBOX_ARG=()
if [[ "${EUID}" -eq 0 ]] && [[ "${ELECTRON_RUN_AS_NODE}" != "1" ]]; then
	_SANDBOX_ARG=("--no-sandbox")
fi
_OZONE_VAR="${_APPDIR##*/}"; _OZONE_VAR="${_OZONE_VAR^^}"; _OZONE_VAR="${_OZONE_VAR//[^A-Z0-9_]/_}_OZONE_PLATFORM"
case "${!_OZONE_VAR:-auto}" in
	x11)		_OZONE_ARG=("--ozone-platform=x11") ;;
	wayland)	_OZONE_ARG=("--ozone-platform=wayland") ;;
	auto)		_OZONE_ARG=() ;;
	*)			echo "${0##*/}: Unknown Ozone platform '${!_OZONE_VAR}' (available: x11|wayland|auto), falling back to auto" >&2; _OZONE_ARG=() ;;
esac
exec electron@electronversion@ "${_SANDBOX_ARG[@]}" "${_OZONE_ARG[@]}" --require "${_APPDIR}/@appname@.js" --app "${_RUNNAME}" "$@"