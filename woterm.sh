#!/bin/sh
set -e
APPDIR=/opt/woterm
export PATH="${APPDIR}/bin:${PATH}"
export LD_LIBRARY_PATH="${APPDIR}/bin:${APPDIR}/lib:${LD_LIBRARY_PATH}"
cd "${APPDIR}"
exec ./bin/woterm --no-sandbox %U
