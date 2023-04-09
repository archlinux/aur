#!/usr/bin/env bash

#    enable-graphical-services
#
#    ----------------------------------------------------------------------
#    Copyright © 2023  Pellegrino Prevete
#
#    All rights reserved
#    ----------------------------------------------------------------------
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

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
