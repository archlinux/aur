#!/bin/bash

APPDIR="@FOLDER@"
export LD_LIBRARY_PATH="${APPDIR}/lib/:${LD_LIBRARY_PATH}"

exec "${APPDIR}/inboxer"
