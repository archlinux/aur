#!/bin/bash
set -e
export _APPDIR="/usr/lib/@appname@"
export CHROME_DESKTOP="@appname@.desktop"
export LD_LIBRARY_PATH="${_APPDIR}/lib:${LD_LIBRARY_PATH}"
if [[ -f "${_APPDIR}/app.asar" ]]; then
	_RUNNAME="${_APPDIR}/app.asar"
elif [[ -d "${_APPDIR}/app" ]]; then
	_RUNNAME="${_APPDIR}/app"
elif [[ -d "${_APPDIR}/app.asar.unpacked" ]]; then
	_RUNNAME="${_APPDIR}/app.asar.unpacked"
else
	_RUNNAME="${_APPDIR}/@runname@"
fi
_SANDBOX_ARG=()
if [[ "${EUID}" -eq 0 ]] && [[ "${ELECTRON_RUN_AS_NODE}" != "1" ]]; then
	_SANDBOX_ARG=("--no-sandbox")
fi
_ozone_var="${_APPDIR##*/}"
_ozone_var="${_ozone_var^^}"
_ozone_var="${_ozone_var//[^A-Z0-9_]/_}_OZONE_PLATFORM"
_OZONE_HINT="${!_ozone_var:-x11}"
_OZONE_ARG=()
case "${_OZONE_HINT}" in
x11)
	_OZONE_ARG=("--ozone-platform=x11")
	;;
wayland)
	_OZONE_ARG=("--enable-features=UseOzonePlatform" "--ozone-platform=wayland")
	;;
auto)
	:
	;;
*)
	echo "${0##*/}: 未知 Ozone 平台 '${_OZONE_HINT}' (可用: x11|wayland|auto), 按 x11 处理" >&2
	_OZONE_ARG=("--ozone-platform=x11")
	;;
esac
exec electron@electronversion@ "${_SANDBOX_ARG[@]}" "${_OZONE_ARG[@]}" --require "${_APPDIR}/resources-path-override.js" --app "${_RUNNAME}" "$@"