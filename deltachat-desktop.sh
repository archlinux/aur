#!/bin/sh
set -e
_appdir="/usr/lib/@appname@"
_runname="${_appdir}/@runname@"
export path="${_appdir}:${path}"
export ld_library_path="${_appdir}/swiftshader:${_appdir}/lib:${ld_library_path}"
export electron_is_dev=0
export node_env=production
cd "${_appdir}"
if [[ $euid -ne 0 ]] || [[ $electron_run_as_node ]]; then
    exec electron@electronversion@ "${_runname}" "$@" || exit $?
else
    exec electron@electronversion@ "${_runname}" --no-sandbox "$@" || exit $?
fi