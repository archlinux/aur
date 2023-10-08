#!/bin/bash
APPDIR="/opt/eusoft-eudic"
export LD_LIBRARY_PATH="${APPDIR}/:$LD_LIBRARY_PATH}"
exec "${APPDIR}/eusoft-eudic.AppImage" --no-sandbox %U