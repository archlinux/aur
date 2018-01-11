#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
# region import
# shellcheck source=./module.sh
source "$(dirname "${BASH_SOURCE[0]}")/module.sh"
bl.module.import bashlink.tools
# endregion
# region functions
alias bl.dictionary.get=bl_dictionary_get
bl_dictionary_get() {
    # shellcheck disable=SC2034,2016
    local __doc__='
    Usage: `variable=$(bl.dictionary.get dictionary_name key)`

    #### Examples

    >>> bl.dictionary.get unset_map unset_value; echo $?
    1
    >>> bl_dictionary__bash_version_test=true
    >>> bl.dictionary.get unset_map unset_value; echo $?
    1

    >>> bl.dictionary.set map foo 2
    >>> bl.dictionary.set map bar 1
    >>> bl.dictionary.get map foo
    >>> bl.dictionary.get map bar
    2
    1

    >>> bl.dictionary.set map foo "a b c"
    >>> bl.dictionary.get map foo
    a b c

    >>> bl_dictionary__bash_version_test=true
    >>> bl.dictionary.set map foo 2
    >>> bl.dictionary.get map foo
    2

    >>> bl_dictionary__bash_version_test=true
    >>> bl.dictionary.set map foo "a b c"
    >>> bl.dictionary.get map foo
    a b c
    '
    local name="$1"
    local key="$2"
    if [[ ${BASH_VERSINFO[0]} -lt 4 ]] \
            || ! [ -z "${bl_dictionary__bash_version_test:-}" ]; then
        local store="bl_dictionary__store_${name}_${key}"
    else
        local store="bl_dictionary__store_${name}[${key}]"
    fi
    bl.tools.is_defined "${store}" || return 1
    local value="${!store}"
    echo "$value"
}
alias bl.dictionary.get_keys=bl_dictionary_get_keys
bl_dictionary_get_keys() {
    local __doc__='
    Get keys of a dictionary as array.

    Usage: `bl.dictionary.get_keys dictionary_name`


    >>> bl.dictionary.set map foo "a b c" bar 5
    >>> bl.dictionary.get_keys map
    bar
    foo

    Iterate keys:
    >>> bl.dictionary.set map foo "a b c" bar 5
    >>> local key
    >>> for key in $(bl.dictionary.get_keys map); do
    >>>     echo "$key": "$(bl.dictionary.get map "$key")"
    >>> done
    bar: 5
    foo: a b c

    >>> bl_dictionary__bash_version_test=true
    >>> bl_dictionary_set map foo "a b c" bar 5
    >>> bl_dictionary_get_keys map | sort -u
    bar
    foo
    '
    local name="$1"
    local keys key
    local store='bl_dictionary__store_'"${name}"
    if [[ ${BASH_VERSINFO[0]} -lt 4 ]] \
            || ! [ -z "${bl_dictionary__bash_version_test:-}" ]; then
        for key in $(declare -p | cut -d' ' -f3 \
                | grep -E "^${store}" | cut -d '=' -f1); do
            echo "${key#${store}_}"
        done
    else
        # shellcheck disable=SC2016
        eval 'keys="${!'"$store"'[@]}"'
    fi
    # shellcheck disable=SC2154
    for key in ${keys:-}; do
        echo "$key"
    done
}
alias bl.dictionary.set=bl_dictionary_set
bl_dictionary_set() {
    # shellcheck disable=SC2016
    local __doc__='
    Usage: `bl.dictionary.set dictionary_name key value`

    #### Tests

    >>> bl.dictionary.set map foo 2
    >>> echo ${bl_dictionary__store_map[foo]}
    2
    >>> bl.dictionary.set map foo "a b c" bar 5
    >>> echo ${dictionary__store_map[foo]}
    >>> echo ${dictionary__store_map[bar]}
    a b c
    5
    >>> bl.dictionary.set map foo "a b c" bar; echo $?
    1

    >>> bl_dictionary__bash_version_test=true
    >>> bl.dictionary.set map foo 2
    >>> echo $bl_dictionary__store_map_foo
    2
    >>> bl_dictionary__bash_version_test=true
    >>> bl.dictionary.set map foo "a b c"
    >>> echo $bl_dictionary__store_map_foo
    a b c
    '
    local name="$1"
    while true; do
        local key="$2"
        local value="\"$3\""
        shift 2
        (( $# % 2 )) || return 1
        # shellcheck disable=SC2154
        if [[ ${BASH_VERSINFO[0]} -lt 4 ]] \
                || ! [ -z "${bl_dictionary__bash_version_test:-}" ]; then
            eval "bl_dictionary__store_${name}_${key}=""$value"
        else
            declare -Ag "bl_dictionary__store_${name}"
            eval "bl_dictionary__store_${name}[${key}]=""$value"
        fi
        (( $# == 1 )) && return
    done
}
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
