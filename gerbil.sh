#!/bin/bash
set -e
_APPDIR="/usr/lib/@appname@"
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
_OVERRIDE="${_APPDIR}/resources-path-override.js"
# override 的 env tier 需要 resources 级路径: gerbil 生产分支以
# process.resourcesPath/../assets 定位资源, 与 AppImage 原生结构同构
# (squashfs-root/resources + squashfs-root/assets)。
# 必须在 _RUNNAME/LD_LIBRARY_PATH 计算完成后再改 _APPDIR。
export _APPDIR="${_APPDIR}/resources"
_SANDBOX_ARG=()
if [[ "${EUID}" -eq 0 ]] && [[ "${ELECTRON_RUN_AS_NODE}" != "1" ]]; then
	_SANDBOX_ARG=("--no-sandbox")
fi
exec electron@electronversion@ "${_SANDBOX_ARG[@]}" --require "${_OVERRIDE}" --app "${_RUNNAME}" "$@"