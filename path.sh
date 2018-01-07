#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
path_convert_to_absolute() {
    local __doc__='
    Converts given path into an absolute one.

    >>> path.convert_to_absolute ./
    /
    '
    local path="$1"
    if [ -d "$path" ]; then
        local abs_path_dir
        abs_path_dir="$(cd "$path" && pwd)"
        echo "${abs_path_dir}"
    else
        local file_name="$(basename "$path")"
        local abs_path_dir="$(cd "$(dirname "$path")" && pwd)"
        echo "${abs_path_dir}/${file_name}"
    fi
}
alias path.convert_to_absolute='path_convert_to_absolute'
path_convert_to_relative() {
    # shellcheck disable=SC2016
    local __doc__='
    Computes relative path from first given argument to second one.

    >>> path_convert_to_relative "/A/B/C" "/A"
    ../..
    >>> path_convert_to_relative "/A/B/C" "/A/B"
    ..
    >>> path_convert_to_relative "/A/B/C" "/A/B/C/D"
    D
    >>> path_convert_to_relative "/A/B/C" "/A/B/C/D/E"
    D/E
    >>> path_convert_to_relative "/A/B/C" "/A/B/D"
    ../D
    >>> path_convert_to_relative "/A/B/C" "/A/B/D/E"
    ../D/E
    >>> path_convert_to_relative "/A/B/C" "/A/D"
    ../../D
    >>> path_convert_to_relative "/A/B/C" "/A/D/E"
    ../../D/E
    >>> path_convert_to_relative "/A/B/C" "/D/E/F"
    ../../../D/E/F
    >>> path_convert_to_relative "/" "/"
    .
    >>> path_convert_to_relative "/A/B/C" "/A/B/C"
    .
    >>> path_convert_to_relative "/A/B/C" "/"
    ../../../
    '
    # both $1 and $2 are absolute paths beginning with /
    # returns relative path to $2/$target from $1/$source
    local source="$1"
    local target="$2"
    if [[ "$source" == "$target" ]]; then
        echo "."
        return
    fi

    local common_part="$source" # for now
    local result="" # for now

    while [[ "${target#$common_part}" == "${target}" ]]; do
        # no match, means that candidate common part is not correct
        # go up one level (reduce common part)
        common_part="$(dirname "$common_part")"
        # and record that we went back, with correct / handling
        if [[ -z $result ]]; then
            result=".."
        else
            result="../$result"
        fi
    done

    if [[ $common_part == "/" ]]; then
        # special case for root (no common path)
        result="$result/"
    fi

    # since we now have identified the common part,
    # compute the non-common part
    local forward_part="${target#$common_part}"

    # and now stick all parts together
    if [[ -n $result ]] && [[ -n $forward_part ]]; then
        result="$result$forward_part"
    elif [[ -n $forward_part ]]; then
        # extra slash removal
        result="${forward_part:1}"
    fi
    echo "$result"
}
alias path.convert_to_relative='path_convert_to_relative'
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
