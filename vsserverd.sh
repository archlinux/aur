#!/bin/sh

# Check whether sudo is needed at all
if [[ "$(whoami)" == "vintagestory" ]]; then
	SUDO_CMD=()
else
	SUDO_CMD=("sudo" "-u" "vintagestory")
fi

if [ "$1" == "console" ]; then
  "${SUDO_CMD[@]}" screen -r vintagestory_server
else
  "${SUDO_CMD[@]}" /opt/vintagestory-server/server.sh "$@"
fi
