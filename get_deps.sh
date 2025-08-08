#!/bin/bash

## This script is for generating the dependency list of the package
## Usage:
##  get_deps.sh elffile.so ...
PKGBUILD_FILE=$(dirname $(realpath "$0"))/PKGBUILD
declare -a LIBRARIES
declare -a DEPENDENCIES

while [ -n "$1" ] ; do
    LIBRARIES+=($(objdump -p "$1" | grep NEEDED | grep -v ld-linux-x86-64.so.2 | awk '{print $2}'))
    shift
done
printf "Found %d dynamic libraries. cleaning them up\n" "${#LIBRARIES[@]}"
LIBRARIES=($(printf -- '%s\n' ${LIBRARIES[@]} | sort -u))
printf "Amount of unique dynamic libraries: %d\n" "${#LIBRARIES[@]}"
for dep in ${LIBRARIES[@]} ; do
    case "$dep" in
        /*)
            echo "Raw paths are ignored: $dep"
            ;;
        *)
            libdep=${dep%*.so*}.so
            libversion=${dep##*so.}
            echo "Checking $dep"
            if [[ "$dep" =~ '.so$' ]] ; then
                query="$dep"
            else
                query="$libdep=$libversion"
            fi
            if pacman -Qqq "$query" 2>/dev/null >/dev/null; then
                DEPENDENCIES+=("$query")
            else
                DEPENDENCIES+=($(pacman -F --machinereadable "usr/lib/$dep" | cut -f 2 -d '' | head -n 1))
            fi
            ;;
    esac
done
printf "Amount of found dependencies: %d\n" "${#DEPENDENCIES[@]}"
DEPENDENCIES=($(printf -- '%s\n' ${DEPENDENCIES[@]} | sort -u))
printf "Amount of unique dependencies: %d\n" "${#DEPENDENCIES[@]}"
echo "depends=("
printf "    %s\n" ${DEPENDENCIES[@]}
echo ")"
