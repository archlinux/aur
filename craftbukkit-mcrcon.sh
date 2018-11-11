#!/bin/bash

if [ "$#" -eq 0 ]; then
  cat <<EOF
Usage: craftbukkit-mcrcon [MCRCON-OPTIONS]... [COMMANDS]...
Calls mcrcon with proper host, port, and password for the currently running
minecraft server.

Examples:
  craftbukkit-mcrcon "say hello world!"
  craftbukkit-mcrcon "say line 1" "say line 2"
  craftbukkit-mcrcon -c help
  craftbukkit-mcrcon -t
EOF
  exit 1
fi

VARS=/run/craftbukkit/vars

if [ ! -e "$VARS" ]; then
  echo "Minecraft not currently running" 2>&1
  exit 1
fi

. "$VARS"

if [ ! -r "$VARS" ]; then
  echo "Make sure you are part of the craftbukkit group" 2>&1
  exit 1
fi

if [ "$rcon" != true ]; then
  echo "RCON must be enabled and mcrcon installed" >&2
  exit 1
fi

# Issue command passed to this script as an argument
exec /usr/bin/mcrcon -H localhost -P "$port" -p "$password" "$@"
