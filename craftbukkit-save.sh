#!/bin/bash

if [ "$#" -eq 0 ]; then
  cat <<EOF
Usage: craftbukkit-save [-d DIR] COMMAND...
Executes COMMAND with Minecraft's saving disabled

Options:
  -d DIR  Specifies the server directory being used, to distinguish which
          server to access when using minecraft@.service, craftbukkit@.service,
          or spigot@.service. After the path is made absolute, the encoded form
          ("systemd-escape -p") should match the instance name (part after
          the @). Empty string means no instance (same as not providing the
          argument).

Disabling saving lets users continue using the Minecraft server while also
providing a consistent view of the Minecraft files. This allows a consistent
backup (or "snapshot") to be made. Saving is automatically enabled when COMMAND
completes.
EOF
  exit 1
fi

DIR=
if [ "$1" = "-d" ]; then
  if [ "$#" -lt 2 ]; then
    echo "Must specify a directory after -d" >&2
    exit 1
  fi
  DIR="$2"
  shift 2
fi

if /usr/bin/craftbukkit-mcrcon -d "$DIR" --is-running; then
  if ! /usr/bin/craftbukkit-mcrcon -d "$DIR" --dryrun; then
    echo "Warning: RCON not available. Can't guarantee valid backups." >&2
  else
    trap '/usr/bin/craftbukkit-mcrcon save-on' EXIT
    /usr/bin/craftbukkit-mcrcon save-off save-all
  fi
fi

"$@"
