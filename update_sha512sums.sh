#!/bin/bash

update_sha512sums ()
{
    local pkgbuild_file="$1";
    shift
    local -a new_sums=("$@");
    if [ ! -f "$pkgbuild_file" ]; then
        echo "Error: PKGBUILD file '$pkgbuild_file' not found.";
        return 1;
    fi;
    if [ ${#new_sums[@]} -eq 0 ]; then
        echo "Error: No new SHA512 sums provided.";
        return 1;
    fi;
    local newsums="sha512sums=(";
    for i in "${!new_sums[@]}";
    do
        if [ $i -eq 0 ]; then
            newsums+="'${new_sums[$i]}'";
        else
            newsums+="\n            '${new_sums[$i]}'";
        fi;
    done;
    newsums+=")";
    awk -v newsums="$newsums" '
    /^sha512sums=/,/\)/ {
        if (!printed) {
            print newsums
            printed=1
        }
        next
    }
    1
    ' "$pkgbuild_file" > "${pkgbuild_file}.tmp" && mv "${pkgbuild_file}.tmp" "$pkgbuild_file";
    echo "Updated SHA512 sums in $pkgbuild_file"
}

update_sha512sums "$@"

