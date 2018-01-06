#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
core_is_defined() {
    # shellcheck disable=SC2034
    local __doc__='
    Tests if variable is defined (can also be empty)

    >>> local foo="bar"
    >>> core.is_defined foo; echo $?
    >>> [[ -v foo ]]; echo $?
    0
    0
    >>> local defined_but_empty=""
    >>> core.is_defined defined_but_empty; echo $?
    0
    >>> core.is_defined undefined_variable; echo $?
    1
    >>> set -o nounset
    >>> core.is_defined undefined_variable; echo $?
    1
    Same Tests for bash < 4.3
    >>> core__bash_version_test=true
    >>> local foo="bar"
    >>> core.is_defined foo; echo $?
    0
    >>> core__bash_version_test=true
    >>> local defined_but_empty=""
    >>> core.is_defined defined_but_empty; echo $?
    0
    >>> core__bash_version_test=true
    >>> core.is_defined undefined_variable; echo $?
    1
    >>> core__bash_version_test=true
    >>> set -o nounset
    >>> core.is_defined undefined_variable; echo $?
    1
    '
    (
    set +o nounset
    if ((BASH_VERSINFO[0] >= 4)) && ((BASH_VERSINFO[1] >= 3)) \
            && [ -z "${core__bash_version_test:-}" ]; then
        [[ -v "${1:-}" ]] || exit 1
    else # for bash < 4.3
        # NOTE: ${varname:-foo} expands to foo if varname is unset or set to the
        # empty string; ${varname-foo} only expands to foo if varname is unset.
        # shellcheck disable=SC2016
        eval '! [[ "${'"${1}"'-this_variable_is_undefined_!!!}"' \
            ' == "this_variable_is_undefined_!!!" ]]'
        exit $?
    fi
    )
}
alias core.is_defined="core_is_defined"
core_is_empty() {
    local __doc__='
    Tests if variable is empty (undefined variables are not empty)

    >>> local foo="bar"
    >>> core.is_empty foo; echo $?
    1
    >>> local defined_and_empty=""
    >>> core.is_empty defined_and_empty; echo $?
    0
    >>> core.is_empty undefined_variable; echo $?
    1
    >>> set -u
    >>> core.is_empty undefined_variable; echo $?
    1
    '
    local variable_name="$1"
    core_is_defined "$variable_name" || return 1
    [ -z "${!variable_name}" ] || return 1
}
alias core.is_empty="core_is_empty"
core_is_main() {
    local __doc__='
    Returns true if current script is being executed.

    >>> # NOTE: This test passes because "is_main" is called by "doctest.sh"
    >>> # which is being executed.
    >>> core.is_main && echo yes
    yes
    '
    [[ "${BASH_SOURCE[1]}" = "$0" ]]
}
alias core.is_main="core_is_main"
core_unique() {
    # shellcheck disable=SC2034,SC2016
    local __doc__='
    >>> local foo="a\nb\na\nb\nc\nb\nc"
    >>> echo -e "$foo" | core.unique
    a
    b
    c
    '
    nl "$@" | sort --key 2 | uniq --skip-fields 1 | sort --numeric-sort | \
        sed 's/\s*[0-9]\+\s\+//'
}
alias core.unique="core_unique"
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
