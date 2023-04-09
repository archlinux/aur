#!/usr/bin/env bash

_systemctl="/usr/bin/systemctl"

_restart_if_not_running() {
  local _service="${1}"
  if ! "${_systemctl}" --user is-active --quiet "${_service}"; then
      "${_systemctl}" --user restart "${_service}"
  fi
}

_restart_if_not_running "dbus"
"${_systemctl}" --user import-environment

$@
