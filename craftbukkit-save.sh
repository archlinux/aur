#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo <<EOF
Usage: craftbukkit-save COMMAND...
Executes COMMAND with Minecraft's saving disabled

Disabling saving lets users continue using the Minecraft server while also
providing a consistent view of the Minecraft files. This allows a consistent
backup (or "snapshot") to be made. Saving is automatically enabled when COMMAND
completes.
EOF
fi

if [ -e /run/craftbukkit/vars ]; then
  . /run/craftbukkit/vars
  if [ ! -r /run/craftbukkit/vars ]; then
    echo "Warning: RCON not available. Can't guarantee valid backups." >&2
    echo "Make sure you are part of the craftbukkit group." >&2
  elif [ "$rcon" != true ]; then
    echo "Warning: RCON not available. Can't guarantee valid backups." >&2
    echo "Enable rcon in server.properties and install mcrcon." >&2
  else
    trap '/usr/bin/craftbukkit-mcrcon save-on' EXIT
    /usr/bin/craftbukkit-mcrcon save-off save-all
  fi
fi

"$@"
