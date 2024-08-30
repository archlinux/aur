#!/bin/bash
set -o pipefail
_APPDIR=/usr/lib/@appname@
_RUNNAME="${_APPDIR}/Reader_Pro/@runname@"
export PATH="${_APPDIR}/Reader_Pro:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/Reader_Pro:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/Reader_Pro:${QT_PLUGIN_PATH}"
gBinPath=$(dirname "$0")
if [ -d "${gBinPath}/OFDPlugin" ]; then
	gInstallPath="${gBinPath}"
else	
	gInstallPath="${_APPDIR}/Reader_Pro"
fi
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?