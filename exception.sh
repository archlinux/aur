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
bl.module.import bashlink.logging
# endregion
# shellcheck disable=SC2034,SC2016
bl_exception__doc__='
    NOTE: The try block is executed in a subshell, so no outer variables can be
    assigned.

    >>> bl.exception.activate
    >>> false
    +doctest_ellipsis
    Traceback (most recent call first):
    ...

    >>> bl.exception.activate
    >>> bl.exception.try {
    >>>     false
    >>> }; bl.exception.catch {
    >>>     echo caught
    >>> }
    caught

    exception in a subshell:
    >>> bl.exception.activate
    >>> ( false )
    +doctest_ellipsis
    Traceback (most recent call first):
    ...
    Traceback (most recent call first):
    ...
    >>> bl.exception.activate
    >>> bl.exception.try {
    >>>     (false; echo "this should not be printed")
    >>>     echo "this should not be printed"
    >>> }; bl.exception.catch {
    >>>     echo caught
    >>> }
    +doctest_ellipsis
    caught

    Nested exception:
    >>> bl_exception_foo() {
    >>>     true
    >>>     bl.exception.try {
    >>>         false
    >>>     }; bl.exception.catch {
    >>>         echo caught inside foo
    >>>     }
    >>>     false # this is cought at top level
    >>>     echo this should never be printed
    >>> }
    >>>
    >>> bl.exception.try {
    >>>     bl_exception_foo
    >>> }; bl.exception.catch {
    >>>     echo caught
    >>> }
    >>>
    caught inside foo
    caught

    exception are implicitely active inside try blocks:
    >>> foo() {
    >>>     echo $1
    >>>     true
    >>>     bl.exception.try {
    >>>         false
    >>>     }; bl.exception.catch {
    >>>         echo caught inside foo
    >>>     }
    >>>     false # this is not caught
    >>>     echo this should never be printed
    >>> }
    >>>
    >>> foo "exception NOT ACTIVE:"
    >>> bl.exception.activate
    >>> foo "exception ACTIVE:"
    +doctest_ellipsis
    exception NOT ACTIVE:
    caught inside foo
    this should never be printed
    exception ACTIVE:
    caught inside foo
    Traceback (most recent call first):
    ...

    exception inside conditionals:
    >>> bl.exception.activate
    >>> false && echo "should not be printed"
    >>> (false) && echo "should not be printed"
    >>> bl.exception.try {
    >>>     (
    >>>     false
    >>>     echo "should not be printed"
    >>>     )
    >>> }; bl.exception.catch {
    >>>     echo caught
    >>> }
    caught

    Print a caught exception traceback.
    >>> bl.exception.try {
    >>>     false
    >>> }; bl.exception.catch {
    >>>     echo caught
    >>>     echo "$exception_last_traceback"
    >>> }
    +doctest_ellipsis
    caught
    Traceback (most recent call first):
    ...

    Different syntax variations are possible.
    >>> bl.exception.try {
    >>>     ! true
    >>> }; bl.exception.catch {
    >>>     echo caught
    >>> }

    >>> bl.exception.try
    >>>     false
    >>> bl.exception.catch {
    >>>     echo caught
    >>> }
    caught

    >>> bl.exception.try
    >>>     false
    >>> bl.exception.catch
    >>>     echo caught
    caught

    >>> bl.exception.try {
    >>>     false
    >>> }
    >>> bl.exception.catch {
    >>>     echo caught
    >>> }
    caught

    >>> bl.exception.try {
    >>>     false
    >>> }
    >>> bl.exception.catch
    >>> {
    >>>     echo caught
    >>> }
    caught
'
bl_exception_active=false
bl_exception_active_before_try=false
declare -ig bl_exception_try_catch_level=0
bl_exception_error_handler() {
    local error_code=$?
    local traceback="Traceback (most recent call first):"
    local -i i=0
    while caller $i > /dev/null
    do
        local -a trace=( $(caller $i) )
        local line=${trace[0]}
        local subroutine=${trace[1]}
        local filename=${trace[2]}
        traceback="$traceback"'\n'"[$i] ${filename}:${line}: ${subroutine}"
        ((i++))
    done
    if (( bl_exception_try_catch_level == 0 )); then
        bl.logging.plain "$traceback" 1>&2
    else
        bl.logging.plain "$traceback" >"$bl_exception_last_traceback_file"
    fi
    exit $error_code
}
alias bl.exception.error_handler=bl_exception_error_handler
bl_exception_activate() {
    $bl_exception_active && return 0

    bl_exception_errtrace_saved=$(set -o | awk '/errtrace/ {print $2}')
    bl_exception_pipefail_saved=$(set -o | awk '/pipefail/ {print $2}')
    bl_exception_functrace_saved=$(set -o | awk '/functrace/ {print $2}')
    bl_exception_err_traps=$(trap -p ERR | cut --delimiter "'" --fields 2)
    bl_exception_ps4_saved="$PS4"

    # improve xtrace output (set -x)
    export PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'

    # If set, any trap on ERR is inherited by shell functions,
    # command substitutions, and commands executed in a subshell environment.
    # The ERR trap is normally not inherited in such cases.
    set -o errtrace
    # If set, any trap on DEBUG and RETURN are inherited by shell functions,
    # command substitutions, and commands executed in a subshell environment.
    # The DEBUG and RETURN traps are normally not inherited in such cases.
    #set -o functrace
    # If set, the return value of a pipeline is the value of the last
    # (rightmost) command to exit with a non-zero status, or zero if all
    # commands in the pipeline exit successfully. This option is disabled by
    # default.
    set -o pipefail
    # Treat unset variables and parameters other than the special parameters
    # ‘@’ or ‘*’ as an error when performing parameter expansion.
    # An error message will be written to the standard error, and a
    # non-interactive shell will exit.
    #set -o nounset

    # traps:
    # EXIT      executed on shell exit
    # DEBUG	executed before every simple command
    # RETURN    executed when a shell function or a sourced code finishes executing
    # ERR       executed each time a command's failure would cause the shell to exit when the '-e' option ('errexit') is enabled

    # ERR is not executed in following cases:
    # >>> err() { return 1;}
    # >>> ! err
    # >>> err || echo foo
    # >>> err && echo foo

    trap bl_exception_error_handler ERR
    #trap bl_exception_debug_handler DEBUG
    #trap bl_exception_exit_handler EXIT
    bl_exception_active=true
}
alias bl.exception.activate=bl_exception_activate
bl_exception_deactivate() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    >>> set -o errtrace
    >>> trap '\''echo $foo'\'' ERR
    >>> bl.exception.activate
    >>> trap -p ERR | cut --delimiter "'\''" --fields 2
    >>> bl.exception.deactivate
    >>> trap -p ERR | cut --delimiter "'\''" --fields 2
    bl.exception.error_handler
    echo $foo
    '
    $bl_exception_active || return 0
    [ "$bl_exception_errtrace_saved" = "off" ] && set +o errtrace
    [ "$bl_exception_pipefail_saved" = "off" ] && set +o pipefail
    [ "$bl_exception_functrace_saved" = "off" ] && set +o functrace
    export PS4="$bl_exception_ps4_saved"
    # shellcheck disable=SC2064
    trap "$bl_exception_err_traps" ERR
    bl_exception_active=false
}
alias bl.exception.deactivate=bl_exception_deactivate
bl_exception_enter_try() {
    if (( bl_exception_try_catch_level == 0 )); then
        bl_exception_last_traceback_file="$(mktemp --suffix=rebash-exception)"
        bl_exception_active_before_try=$bl_exception_active
    fi
    bl.exception.deactivate
    bl.exception.try_catch_level+=1
}
alias bl.exception.enter_try=bl_exception_enter_try
bl_exception_exit_try() {
    local bl_exception_result=$1
    bl_exception_try_catch_level+=-1
    if (( bl_exception_try_catch_level == 0 )); then
        $bl_exception_active_before_try && bl_exception_activate
        bl_exception_last_traceback="$(
            bl.logging.cat "$bl_exception_last_traceback_file"
        )"
        rm "$bl_exception_last_traceback_file"
    else
        bl.exception.activate
    fi
    return $bl_exception_result
}
alias bl.exception.exit_try=bl_exception_exit_try
alias bl.exception.try='bl.exception.enter_try; (bl.exception.activate; '
alias bl.exception.catch='true); bl.exception.exit_try $? || '
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
