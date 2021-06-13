#!/bin/bash
# a script for generating lists of pacman packages.

# add typical bin dirs to PATH
export PATH="${PATH}:/usr/bin:/usr/local/bin"

# load and check configuration
. /etc/paclist/paclist.conf || exit 1
[ ${#lists[@]} -lt 4 ] && exit 1
[ $(( ${#lists[@]} % 4 )) -ne 0 ] && exit 1

for i in $(seq 0 4 $(( ${#lists[@]} - 4 )) ); do

    user="${lists[$i]}"
    group="${lists[$i+1]}"
    path="${lists[$i+2]}$suffix"
    cmd="${lists[$i+3]}"

    runuser -u "$user" -g "$group" -- mkdir -p "$(dirname "$path")"
    sh -c -- "$cmd" > "$path"
    chown "$user":"$group" -- "$path"

done
