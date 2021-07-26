#!/usr/bin/env bash

WINE="${WINE:-$(which wine)}"

"$WINE" regsvr32 wineasio.dll
"${WINE}64" regsvr32 wineasio.dll || true
