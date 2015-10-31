#!/bin/bash
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

now=`date +"%Y%m%d_%Hh%m"`

# Load configuration
. /etc/conf.d/acpi-eeepc-generic.conf

case "$1" in
    stop)
        [ ! -d "${LOGSBACKUP_FOLDER}" ] && mkdir -p "${LOGSBACKUP_FOLDER}"
        tar -zcf "${LOGSBACKUP_FOLDER}/$now.tar.gz" /var/log/*
    ;;
    start)
    ;;
    *)
        echo 'Usage: /etc/rc.d/logsbackup {start||stop}'
        exit 1
   ;;
esac
