#!/bin/bash

DIR=
ISRUNNING=
DRYRUN=
while [ "$#" -gt 0 ]; do
  case "$1" in
  -d)
    DIR="$2"
    shift 2
    ;;
  --is-running)
    ISRUNNING=1
    shift
    ;;
  --dryrun)
    DRYRUN=1
    shift
    ;;
  *)
    break
    ;;
  esac
done

if [ -z "$ISRUNNING" -a -z "$DRYRUN" -a "$#" -eq 0 ]; then
  cat <<EOF
Usage: craftbukkit-mcrcon [OPTIONS] [MCRCON-OPTIONS]... [COMMANDS]...
Calls mcrcon with proper host, port, and password for the currently running
minecraft server.

Options:
  -d DIR  Specifies the server directory being used, to distinguish which
          server to access when using minecraft@.service, craftbukkit@.service,
          or spigot@.service. After the path is made absolute, the encoded form
          ("systemd-escape -p") should match the instance name (part after
          the @). Empty string means no instance (same as not providing the
          argument).

  --is-running  Does not run command. Exit code 0 if Minecraft is running
  --dryrun      Does not run command. Exit code 0 if rcon available

Examples:
  craftbukkit-mcrcon "say hello world!"
  craftbukkit-mcrcon "say line 1" "say line 2"
  craftbukkit-mcrcon -c help
  craftbukkit-mcrcon -t
  craftbukkit-mcrcon -d /srv/spigot/ "say hello world!"
EOF
  exit 1
fi

RUNTIME_DIR=/run/craftbukkit
if [ ! -z "$DIR" ]; then
  if [ ! -d "$DIR" ]; then
    echo "Not a directory: $DIR" >&2
    exit 1
  fi
  DIR="$(cd "$DIR" && pwd)"
  if [ -z "$DIR" ]; then
    echo "Failed to compute runtime directory" >&2
    exit 1
  fi
  RUNTIME_DIR="/run/craftbukkit@$(systemd-escape -p "$DIR")"
fi

VARS="$RUNTIME_DIR/vars"

if [ ! -e "$VARS" ]; then
  echo "Minecraft not currently running" >&2
  exit 1
fi

if [ ! -z "$ISRUNNING" ]; then
  exit 0
fi

. "$VARS"

if [ ! -r "$VARS" ]; then
  echo "Make sure you are part of the craftbukkit group" >&2
  exit 1
fi

if [ "$rcon" != true ]; then
  echo "rcon must be enabled in server.properties and mcrcon installed" >&2
  exit 1
fi

if [ ! -z "$DRYRUN" ]; then
  exit 0
fi
 
# Issue command passed to this script as an argument
exec /usr/bin/mcrcon -H localhost -P "$port" -p "$password" "$@"
