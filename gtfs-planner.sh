#!/bin/sh

_bindir=/usr/lib/gtfs-planner/bin
_programme="${_bindir}"/bus-planning

### Wrapper script to start gtfs-planner's 'bus-planning' in a directory where the config file is.
#   This wrapper script is licensed under GPL-3.0-only.

# 'bus-planning' expects the configuration file hardcoded at ./gtfs-config.yaml :-(.
# By default, use file in '/etc/gtfs-planner', but can be overridden with '--configfile <config>' (will then use the parent directory of '<config>'.)

_configfile=/etc/gtfs-planner/gtfs-config.yaml


# Control debug output of this script. Set default which can be overridden by environment variable.
if [ -z "${DEBUG}" ]; then
  DEBUG=false
fi

msg() {
  printf '%s\n' "$@"
}

errmsg() {
  msg "$@" > /dev/stderr
}

debug() {
  if "${DEBUG}"; then
    msg "$@"
  fi
}


_usage="$0: Wrapper script around '${_programme}' helping it to find the config file.

Usage:

  $0                           Start in the directory where default config file '${_configfile}' resides.
  $0    --config <configfile>  Start in the directory where manually specified '<configfile>' resides.
  $0 -h|--help                 Print this help message.

Set environment variable '\$DEBUG=true' to get debugging information from this script."


_arglist=()
while [ $# -ge 1 ]; do
  case "$1" in
    "--config") # Handle config file.
      shift
      if [ $# -ge 1 ]; then
        _configfile="$1"
        shift
      else
        errmsg "$0: Error: Option '--config' requires an argument (config file), but none was provided."
        errmsg "Aborting."
        exit 1
      fi
    ;;
    '-h'|'--help')
      msg "${_usage}"
      shift
      exit 0
    ;;
    *)
      _arglist+=("$1")
      shift
    ;;
  esac
done


debug "DEBUG: About to execute"
debug "       cd $(dirname "${_configfile}")"
cd "$(dirname "${_configfile}")" || exit "$?"
debug "DEBUG: About to execute"
debug "       ${_programme} ${_arglist[@]}"
exec "${_programme}" "${_arglist[@]}"
