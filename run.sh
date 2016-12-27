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

pkg_dir="/usr/share/swish-cplint"
pid_file="/run/swish-cplint/swish-cplint.pid"
installed_file=""$pkg_dir"/installed"
deps_installer=""$pkg_dir"/install_web_iface_deps.pl"
user="swish"
group="swish"

help()
{
    cat<<-EOF
swish-cplint [OPTION]
SWI-Prolog for SHaring: a SWI-Prolog web IDE integrated with the cplint suite

Only a single option is permitted.
    -h      print this help
    -i      install dependencies
    -k      kill swish-cplint
    -s      start swish-cplint

Exit status:
 0  if OK,
 1  some error occurred.

Full documentation at: <https://github.com/friguzzi/swish>
and at: <https://github.com/friguzzi/cplint>
EOF
}

init()
{
    printf "%s\n" "This may take a while."
    pushd "$pkg_dir"
    $deps_installer
    if [ $? -eq 0 ]; then
        echo "# Don't touch this file" > "$installed_file"
        echo "true" >> "$installed_file"
    else
        1>&2 printf "%s\n" "Install web dependencies error"
        exit 1
    fi
}

installed()
{
    if [ ! -f "$installed_file" ]; then
        1>&2 printf "%s\n" "You need to run \
'sudo -u swish swish-cplint -i' \
first"
        exit 1
    fi
}

killd()
{
    # kill action only if process exists.
    if [ -f "$pid_file" ]; then
        pid=$(cat "$pid_file")
        ps -q $pid > /dev/null
        if [ $? -eq 0 ]; then
            kill -s TERM $pid
        fi
    fi
}

remove()
{
    :
}

startd()
{
    local pid=""

    # The following means installed && { ... }
    installed
    {
        (
            cd "$pkg_dir"
            exec swipl --quiet -f "$pkg_dir"/run.pl
        ) &
        pid="$!"
    } 1>&2

    write_pid_file "$pid"
}

#
# shared_functions.sh
#
# Copyright (C) 2016 frnmst (Franco Masotti) <franco.masotti@student.unife.it>
#
# This file is part of swish-installer.
#
# swish-installer is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# swish-installer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with swish-installer.  If not, see <http://www.gnu.org/licenses/>.
#
#

# This file is used by the various run.sh.

check_running_user_and_group()
{
    if [ "$(id -un)" = "$user" ] && [ "$(id -gn)" = "$group" ]; then
        :
    else
        printf "User must be "$user"\n"
        printf "Group must be "$group"\n"
        return 1
    fi
}

write_pid_file()
{
    local pid="$1"

    if [ -n "$pid" ]; then
        printf "Server running with pid $pid\n"
        printf "$pid\n" > "$pid_file"
    else
        printf "Server error\n"
        return 1
    fi
}

option_parser()
{
    getopts ":hikrs" opt "$@"
    case "$opt" in
        h ) help            ;;
        i ) init            ;;
        k ) killd           ;;
        r ) remove          ;;
        s ) startd          ;;
        ? ) help; return 1  ;;
    esac
}

main()
{
    check_running_user_and_group && option_parser "$@"
}

main "$@"
