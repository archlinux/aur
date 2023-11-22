#!/bin/bash
APPDIR="/opt/mailmaster"
export LIBRARY_PATH="${APPDIR}/lib":"${LIBRARY_PATH}"
export LD_LIBRARY_PATH="${APPDIR}/lib":"${LD_LIBRARY_PATH}"
cd "${APPDIR}"
exec ./mailmaster $@