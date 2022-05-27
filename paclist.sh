#!/bin/bash
# a script for generating lists of pacman packages.

# config file
conf=/etc/paclist/config

# populate the PATH variable with sane defaults
export PATH=$PATH:/usr/bin:/usr/local/bin

# source the config file
source $conf || {
    echo "paclist: failed to source $conf" >&2
    exit 1
}

# perform sanity checks on the lists array
[[ ${#lists[@]} -lt 4 ]] && {
    echo "paclist: the 'lists' array defined in $conf has a size of less than 4" >&2
    exit 1
}
[[ $(( ${#lists[@]} % 4 )) -ne 0 ]] && {
    echo "paclist: the 'lists' array defined in $conf is not divisible by 4" >&2
    exit 1
}

[[ $verbose != true ]] && unset verbose

# generate all the lists in parallel
for ((i=0; i<${#lists[@]}; i+=4)); do
    user=${lists[$i]}
    group=${lists[$i+1]}
    path=${lists[$i+2]}$suffix
    cmd=${lists[$i+3]}
    sh -c -- "${cmd:?}" | install ${verbose:+-v} -Dm644 -o"${user:?}" -g"${group:?}" -- /dev/stdin "${path:?}" &
done

# wait for the lists to be generated
wait
