#!/usr/bin/env bash
set -e
export WINEDEBUG=-all

# shim for passing a single file
if [[ "$#" -eq 1 ]]; then
    path=$1
    shift

    if [[ ! -e "$path" ]]; then  # check if the file actually exists
        printf "noesis: No such file or directory '%s'\n" "$path"
        exit 1
    else  # mangle the path in such a way that wine/noesis is appeased
        if [[ -d "$path" ]]; then
            path="${path}/"  # add mandatory trailing slash for directories
        fi

        set -- "$(winepath --windows "$path" 2>/dev/null)"
    fi
fi

wine "/opt/noesis/Noesis64.exe" "$@"
