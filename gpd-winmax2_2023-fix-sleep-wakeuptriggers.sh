#!/bin/bash

VERSION=20240125.01
_conffile='/etc/gpd-winmax2_2023-sleep-wakeuptriggers.conf'

# gpd-winmax2_2023-fix-sleep-wakeuptriggers -- Switches off wakeup triggers that prevent the GPD Win Max 2 (2023) laptops from sleeping reliably. For background, see https://gitlab.freedesktop.org/drm/amd/-/issues/3073#note_2237586.
# Copyright (C) 2024+ @dreieck
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

_msg() {
  printf '%s\n' "$@"
}

_errmsg() {
  _msg "$@" > /dev/stderr
}

_version() {
  _msg "${VERSION}"
}

_check_conf_file() {
  if ! [ -r "${_conffile}" ]; then
    _errmsg "File '${_conffile}' does not exist or is not readable".
    return 1
  fi
}

_load_conf_file() {
  . "${_conffile}"
}

_check_and_load_conf_file() {
  if _check_conf_file; then
    . "${_conffile}"
  else
    return 1
  fi
}

_start() {
  local _dev _wakeupfile _exitcode _thisexitcode
  _exitcode=0
  _msg "> Switching off wakeup triggers"
  _check_and_load_conf_file && {
    for _dev in "${NOWAKEUPDEVS[@]}"; do
      if [ -e "${_dev}/power/wakeup" ] && [ -w "${_dev}/power/wakeup" ]; then
        _wakeupfile="${_dev}/power/wakeup"
      elif [ -e "${_dev}/wakeup" ] && [ -w "${_dev}/wakeup" ]; then
        _wakeupfile="${_dev}/wakeup"
      else
        _errmsg "\`-> WARNING: '${_dev}/' contains no 'power/wakeup' or 'wakeup' file with write permission!"
        continue
      fi
      _msg "\`-> ${_dev}"
      printf '%s\n' 'disabled' > "${_wakeupfile}"
      _thisexitcode="$?"
      if [ "${_exitcode}" -eq 0 ]; then ## Preserve a non-zero $_exitcode
        _exitcode="${_thisexitcode}"
      fi
    done
  }
  return "${_exitcode}"
}

_stop() {
  local _dev _wakeupfile _exitcode _thisexitcode
  _exitcode=0
  _msg "> Switching on wakeup triggers"
  _check_and_load_conf_file && {
    for _dev in "${NOWAKEUPDEVS[@]}"; do
      if [ -e "${_dev}/power/wakeup" ] && [ -w "${_dev}/power/wakeup" ]; then
        _wakeupfile="${_dev}/power/wakeup"
      elif [ -e "${_dev}/wakeup" ] && [ -w "${_dev}/wakeup" ]; then
        _wakeupfile="${_dev}/wakeup"
      else
        _errmsg "\`-> WARNING: '${_dev}/' contains no 'power/wakeup' or 'wakeup' file with write permission!"
        continue
      fi
      _msg "\`-> ${_dev}"
      printf '%s\n' 'enabled' > "${_wakeupfile}"
      _thisexitcode="$?"
      if [ "${_exitcode}" -eq 0 ]; then ## Preserve a non-zero $_exitcode
        _exitcode="${_thisexitcode}"
      fi
    done
  }
  return "${_exitcode}"
}

_help() {
  _msg "Usage:"
  _msg "  $0 [start|stop|restart|reload|status|-h|--help|-V|--version]"
  _msg ""
  _msg "> 'start' disables wakeup triggers of devices defined in"
  _msg "  'NOWAKEUPDEVS' bash array in '${_conffile}'."
  _msg "> 'stop' enables wakeup triggers of devices defined in"
  _msg "  'NOWAKEUPDEVS' bash array in '${_conffile}'."
}

if [ "$#" -ne 1 ]; then
  _errmsg "$0: Error: Exactly one argument required."
  _errmsg ''
  _errmsg "`_help`"
  exit 11
fi

case "$1" in
  'start')
    _start
  ;;
  'stop')
    _stop
  ;;
  'restart'|'reload')
    _stop
    _start
  ;;
  'status')
    _msg "unknown"
  ;;
  '-V'|'--version')
    _version
  ;;
  '-h'|'--help')
    _help
  ;;
  *)
    _errmsg "$0: Error: Unsupported action '$1'."
    _errmsg ''
    _errmsg "`_help`"
    exit 12
  ;;
esac
