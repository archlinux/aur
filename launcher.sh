#!/usr/bin/env bash

LOCALDIR="${HOME}/.local/share/openrsc-launcher"

if [ ! -d "$LOCALDIR" ]; then
  mkdir -p "$LOCALDIR"
  cp /usr/share/java/openrsc-launcher/OpenRSC.jar "$LOCALDIR"
fi

cd "$LOCALDIR"
exec java -jar OpenRSC.jar "$@" >/dev/null
