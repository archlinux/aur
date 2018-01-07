#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
dictionary_set() {
    # shellcheck disable=SC2016
    local __doc__='
    Usage: `dictionary.set dictionary_name key value`

    #### Tests

    >>> dictionary_set map foo 2
    >>> echo ${dictionary__store_map[foo]}
    2
    >>> dictionary_set map foo "a b c" bar 5
    >>> echo ${dictionary__store_map[foo]}
    >>> echo ${dictionary__store_map[bar]}
    a b c
    5
    >>> dictionary_set map foo "a b c" bar; echo $?
    1

    >>> dictionary__bash_version_test=true
    >>> dictionary_set map foo 2
    >>> echo $dictionary__store_map_foo
    2
    >>> dictionary__bash_version_test=true
    >>> dictionary_set map foo "a b c"
    >>> echo $dictionary__store_map_foo
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
                || ! [ -z "${dictionary__bash_version_test:-}" ]; then
            eval "dictionary__store_${name}_${key}=""$value"
        else
            declare -Ag "dictionary__store_${name}"
            eval "dictionary__store_${name}[${key}]=""$value"
        fi
        (( $# == 1 )) && return
    done
}
dictionary_get_keys() {
    local __doc__='
    Get keys of a dictionary as array.

    Usage: `dictionary.get_keys dictionary_name`


    >>> dictionary_set map foo "a b c" bar 5
    >>> dictionary_get_keys map
    bar
    foo

    Iterate keys:
    >>> dictionary_set map foo "a b c" bar 5
    >>> local key
    >>> for key in $(dictionary_get_keys map); do
    >>>     echo "$key": "$(dictionary_get map "$key")"
    >>> done
    bar: 5
    foo: a b c

    >>> dictionary__bash_version_test=true
    >>> dictionary_set map foo "a b c" bar 5
    >>> dictionary_get_keys map | sort -u
    bar
    foo
    '
    local name="$1"
    local keys key
    local store='dictionary__store_'"${name}"
    if [[ ${BASH_VERSINFO[0]} -lt 4 ]] \
            || ! [ -z "${dictionary__bash_version_test:-}" ]; then
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
dictionary_get() {
    # shellcheck disable=SC2034,2016
    local __doc__='
    Usage: `variable=$(dictionary.get dictionary_name key)`

    #### Examples

    >>> dictionary_get unset_map unset_value; echo $?
    1
    >>> dictionary__bash_version_test=true
    >>> dictionary_get unset_map unset_value; echo $?
    1

    >>> dictionary_set map foo 2
    >>> dictionary_set map bar 1
    >>> dictionary_get map foo
    >>> dictionary_get map bar
    2
    1

    >>> dictionary_set map foo "a b c"
    >>> dictionary_get map foo
    a b c

    >>> dictionary__bash_version_test=true
    >>> dictionary_set map foo 2
    >>> dictionary_get map foo
    2

    >>> dictionary__bash_version_test=true
    >>> dictionary_set map foo "a b c"
    >>> dictionary_get map foo
    a b c
    '
    local name="$1"
    local key="$2"
    if [[ ${BASH_VERSINFO[0]} -lt 4 ]] \
            || ! [ -z "${dictionary__bash_version_test:-}" ]; then
        local store="dictionary__store_${name}_${key}"
    else
        local store="dictionary__store_${name}[${key}]"
    fi
    core_is_defined "${store}" || return 1
    local value="${!store}"
    echo "$value"
}
alias dictionary.set='dictionary_set'
alias dictionary.get='dictionary_get'
alias dictionary.get_keys='dictionary_get_keys'
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
