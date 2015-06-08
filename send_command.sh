#!/bin/bash

# Get connection details from server config file
conf=/srv/craftbukkit/server.properties

rcon=$(grep '^enable-rcon=' $conf)
rcon=${rcon#enable-rcon=}
port=$(grep '^rcon.port=' $conf)
port=${port#rcon.port=}
port=${port:-25575}
password="$(grep '^rcon.password=' $conf)"
password="${password#rcon.password=}"

if [ "$rcon" != true -o -z "$password" ]; then
  echo "RCON must be enabled to operate the server."
fi

# Issue command passed to this script as and argument
if [ ! -z "$1" ]; then
  echo ">$@"
  /usr/bin/mcrcon -H localhost -P $port -p $password -c "$@"
else
  echo "usage  : spigot-command.sh \"<Minecraft command>\""
  echo "example: spigot-command.sh \"say hello world!\""
fi
