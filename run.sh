#!/usr/bin/env sh

#
# run.sh
#
# Copyright (C) 2016 frnmst (Franco Masotti) <franco.masotti@student.unife.it>
#
# This file is part of cplint-installer.
#
# cplint-installer is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# cplint-installer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with cplint-installer.  If not, see <http://www.gnu.org/licenses/>.
#
#

# This is the file called from the /usr/bin/swish-cplint symlink

# Since it's a dameon, it should be able to :
#   start
#   stop
#   (restart)

pid_file="/run/swish-cplint.pid"

if [ "$UID" -eq 0 ]; then
    {
        (exec swipl --quiet -f /usr/share/swish-cplint/run.pl) &
        pid="$!"
    } 1>/dev/null 2>/dev/null

    if [ -n "$pid" ]; then
        printf "Server running with pid $pid\n"
        printf "$pid\n" > "$pid_file"
    else
        printf "Server error\n"
        exit 1
    fi

else
    printf "User must be root\n"
    exit 1
fi
