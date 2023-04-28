#!/usr/bin/env bash

_is_bus_running() {
  local _found=""
  local _not_found="Failed to connect to bus: No medium found"
  _found=$(systemctl --user status dbus 2>&1 >/dev/null)
  if [ "${_found}" == "${_not_found}" ]; then
    return 1
  fi
}


_is_service_running() {
  local _uri="${1}"
  local _out="${2}"
  local _clean="${_uri##ipfs://}"
  local _cat=('ipfs' 'cat' "${_clean}")
  echo "Getting ${_clean}"
  if ! _is_bus_running; then
    echo "INFO: running in a session without bus"
    # run-as -X --uid "$(id -u)" "/usr/bin/echo"
    ipfs daemon 2>&1 | grep -i -o -m1 "Daemon is ready" | xargs -i ipfs cat "${_clean}" > "${_out}"
  else
    if ! systemctl --user is-active --quiet ipfs; then
        systemctl --user restart ipfs
    fi
    ipfs cat "${_clean}" > "${_out}"
  fi
}

_uri="${1}"
_out="${2}"
_is_service_running "${_uri}" "${_out}"
