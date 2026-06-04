#!/bin/bash

_bindir=/usr/lib/gtfs-planner/bin
## With commandline option '--config <configfile>' directly passed to 'gtfs-manager' it can be overridden.
_configfile_yaml=/etc/gtfs-planner/gtfs-config.yaml
_configfile_json=/etc/gtfs-planner/gtfs-config.json

### Wrapper script around 'gtfs-manager' to call system wide installed 'gtfs-import' instead of 'npx gtfs-import' :-(, and use default, overridable, configuration.
#   This wrapper script is licensed under GPL-3.0-only.

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


_action=''
_arglist=()
_configoverridden='false'  # Set to 'true' if on the command line a config file was specified.
while [ $# -ge 1 ]; do
  case "$1" in
    "--config") # Handle config file.
      _configoverridden=true
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
    -*)
      _arglist+=("$1")
      shift
    ;;
    *)
      if [ -z "${_action}" ]; then # Only the first non-option argument defines the action.
        _action="$1"
        if [ "$1"x != "import"x ]; then
          _arglist+=("$1") # If we do not import, then just pass the action to 'gtfs-manager' via normal command line.
        fi
      else
        _arglist+=("$1")
      fi
      shift
    ;;
  esac
done

case "${_action}" in
  "import")
    if ! "${_configoverridden}"; then
      _configfile="${_configfile_json}"
    fi
    # Make sure that also the JSON config file is used if accidentally the YAML one was specified.
    _configfile="${_configfile/%.yaml/.json}"
    debug "DEBUG: About to execute"
    debug "       gtfs-import --configPath ${_configfile} ${_arglist[@]}"
    exec gtfs-import --configPath "${_configfile}" "${_arglist[@]}"
  ;;
  *)
    if ! "${_configoverridden}"; then
      _configfile="${_configfile_yaml}"
    fi
    debug "DEBUG: About to execute"
    debug "       ${_bindir}/gtfs-manager --config ${_configfile} ${_arglist[@]}"
    exec "${_bindir}"/gtfs-manager --config "${_configfile}" "${_arglist[@]}"
  ;;
esac
