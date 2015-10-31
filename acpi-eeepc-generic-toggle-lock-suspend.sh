#!/bin/sh
# Copyright 2009 Nicolas Bigaouette
# This file is part of acpi-eeepc-generic.
# http://code.google.com/p/acpi-eeepc-generic/
#
# acpi-eeepc-generic is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# acpi-eeepc-generic is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with acpi-eeepc-generic.  If not, see <http://www.gnu.org/licenses/>.

. /etc/acpi/eeepc/acpi-eeepc-generic-functions.sh

lock="${EEEPC_VAR}/power.lock"

if [ -e "$lock" ]; then
    msg="You can now suspend normally"
    rm -f $lock
    logger "$msg"
    eeepc_notify "$msg" gnome-session-suspend
    exit 0
else
    msg="Suspend is now blocked"
    touch $lock
    logger "$msg"
    eeepc_notify "$msg" stop
    exit 0
fi

