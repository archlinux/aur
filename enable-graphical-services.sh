#!/usr/bin/env bash

_systemctl="/usr/bin/systemctl"

_restart_if_not_running() {
  local _service="${1}"
  if [ ! "${_systemctl} --quiet --user status ${_service}" ]; then
      echo "${service} not running"
  fi
}

_restart_if_not_running dbus
"${_systemctl}" --user import-environment

$@
