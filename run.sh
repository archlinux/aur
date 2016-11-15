#!/usr/bin/env sh

#
# run.sh
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

pkg_dir="/usr/share/rserve-sandbox-docker"
pid_file="/run/rserve-sandbox-docker/rserve-sandbox-docker.pid"
user="rsd"
group="rsd"
docker_image_name="rserve"

help()
{
    cat<<-EOF
rsd [OPTION]
Docker spec for running Rserve in a sandbox

Only a single option is permitted.
    -h      print this help
    -i      install dependencies
    -k      kill rserve-sandbox-docker
    -s      start rserve-sandbox-docker

Exit status:
 0  if OK,
 1  some error occurred.

Full documentation at: <https://github.com/frnmst/rserve-sandbox>
EOF
}

init()
{
    # Check if rserve image does not exist.
    if [ -z "$(docker images -q "$docker_image_name")" ]; then
        printf "%s\n" "This might take a while"
        pushd "$pkg_dir"
        make image
    else
        1>&2 printf "%s\n" "Docker image already installed"
        exit 1
    fi
}

installed()
{
    if [ -z "$(docker images -q "$docker_image_name")" ]; then
        1>&2 printf "%s\n" "You need to run \
'sudo -u rsd rserve-sandbox-docker -i' \
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
                make -C "$pkg_dir" stop
        fi
    fi
}


startd()
{
    local pid=""

    # The following means installed && { ... }
    installed
    {
        (
            cd "$pkg_dir"
            make run
        ) &
        pid="$!"
    }

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
    getopts ":hiks" opt "$@"
    case "$opt" in
        h ) help            ;;
        i ) init            ;;
        k ) killd           ;;
        s ) startd          ;;
        ? ) help; return 1  ;;
    esac
}

main()
{
    check_running_user_and_group && option_parser "$@"
}

main "$@"
