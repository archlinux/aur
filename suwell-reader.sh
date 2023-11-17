#!/bin/bash
APPDIR=/opt/suwell-reader
export LD_LIBRARY_PATH="${APPDIR}/Reader_Pro:${LD_LIBRARY_PATH}"
exec "${APPDIR}/Reader_Pro/SuwellReader" "${@}"