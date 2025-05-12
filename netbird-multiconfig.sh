#!/bin/bash

# get all available configs from /etc/netbird/*.json directory

# user can override the config folder by setting NETBIRD_CONFIG_FOLDER
CONFIG_FOLDER=${NETBIRD_CONFIG_FOLDER:-/etc/netbird}

# check if the config folder exists
if [ ! -d "$CONFIG_FOLDER" ]; then
  echo "Warning: Config folder $CONFIG_FOLDER does not exist, exiting early..." >&2
  exit 0
fi

for file in "$CONFIG_FOLDER"/*.json; do
  if [ -f "$file" ]; then
    # get name of the file without the extension
    filename=$(basename "$file" .json)
    command_name="netbird-$filename"
    alias $command_name="/usr/bin/netbird --daemon-addr unix:///var/run/netbird-$filename.sock"
    complete -o default -F __start_netbird $command_name
  fi
done

function __netbird__noop() {
  if [[ "__complete" == "$1" ]]; then
    exit 0
  fi

  printf 'You are using a multi-config setup. Please use the config name as a command, e.g. netbird-<config_name>.\n'
}

alias "netbird"="__netbird__noop"
