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
bl.module.import bashlink.arguments
bl.module.import bashlink.array
bl.module.import bashlink.cli
# endregion
# region variables
bl_logging__doc__='
    The available log levels are:
    error critical warn info debug

    The standard loglevel is critical
    >>> bl.logging.get_level
    >>> bl.logging.get_commands_level
    critical
    critical
    >>> bl.logging.error error-message
    >>> bl.logging.critical critical-message
    >>> bl.logging.warn warn-message
    >>> bl.logging.info info-message
    >>> bl.logging.debug debug-message
    +doctest_contains
    error-message
    critical-message

    If the output of commands should be printed, the commands_level needs to be
    greater than or equal to the log_level.
    >>> bl.logging.set_level critical
    >>> bl.logging.set_commands_level debug
    >>> echo foo

    >>> bl.logging.set_level info
    >>> bl.logging.set_commands_level info
    >>> echo foo
    foo

    Another logging prefix can be set by overriding "bl_logging_get_prefix".
    >>> bl_logging_get_prefix() {
    >>>     local level=$1
    >>>     echo "[myprefix - ${level}]"
    >>> }
    >>> bl.logging.critical foo
    [myprefix - critical] foo

    "bl.logging.plain" can be used to print at any log level and without the
    prefix.
    >>> bl.logging.set_level critical
    >>> bl.logging.set_commands_level debug
    >>> bl.logging.plain foo
    foo

    "bl.logging.cat" can be used to print files (e.g "bl.logging.cat < file.txt")
    or heredocs. Like "bl.logging.plain", it also prints at any log level and
    without the prefix.
    >>> echo foo | bl.logging.cat
    foo
'
# logging levels from low to high
bl_logging_levels=(
    error
    critical
    warn
    warning
    info
    verbose
    debug
)
# matches the order of logging levels
bl_logging_levels_color=(
    $bl_cli_color_red
    $bl_cli_color_magenta
    $bl_cli_color_yellow
    $bl_cli_color_yellow
    $bl_cli_color_cyan
    $bl_cli_color_green
    $bl_cli_color_blue
)
bl_logging_commands_level=$(bl.array.get_index 'critical' "${bl_logging_levels[@]}")
bl_logging_level=$(bl.array.get_index 'critical' "${bl_logging_levels[@]}")
# endregion
# region functions
alias bl.logging.set_commands_level=bl_logging_set_commands_level
bl_logging_set_commands_level() {
    bl_logging_commands_level=$(bl.array.get_index "$1" "${bl_logging_levels[@]}")
    if [ "$bl_logging_level" -ge "$bl_logging_commands_level" ]; then
        bl.logging.set_command_output_on
    else
        bl.logging.set_command_output_off
    fi
}
alias bl.logging.get_level=bl_logging_get_level
bl_logging_get_level() {
    echo "${bl_logging_levels[$bl_logging_level]}"
}
alias bl.logging.get_commands_level=bl_logging_get_commands_level
bl_logging_get_commands_level() {
    echo "${bl_logging_levels[$bl_logging_commands_level]}"
}
alias bl.logging.set_level=bl_logging_set_level
bl_logging_set_level() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    >>> bl.logging.set_commands_level info
    >>> bl.logging.set_level info
    >>> echo $bl_logging_level
    >>> echo $bl_logging_commands_level
    3
    3
    '
    bl_logging_level=$(bl.array.get_index "$1" "${bl_logging_levels[@]}")
    if [ "$bl_logging_level" -ge "$bl_logging_commands_level" ]; then
        bl.logging.set_command_output_on
    else
        bl.logging.set_command_output_off
    fi
}
alias bl.logging.get_prefix=bl_logging_get_prefix
bl_logging_get_prefix() {
    local level=$1
    local level_index=$2
    local color=${bl_logging_levels_color[$level_index]}
    # shellcheck disable=SC2154
    local loglevel=${color}${level}${bl_cli_color_default}
    local path="${BASH_SOURCE[2]##./}"
    path=$(basename "$path")
    local prefix=[${loglevel}:"$path":${BASH_LINENO[1]}]
    echo "$prefix"
}
alias bl.logging.log=bl_logging_log
bl_logging_log() {
    local level="$1"
    if [ "$level" = 'warn' ]; then
        level=warning
    fi
    shift
    local level_index
    level_index=$(bl.array.get_index "$level" "${bl_logging_levels[@]}")
    if [ "$level_index" -eq -1 ]; then
        bl.logging.log critical "loglevel \"$level\" not available, use one of: "\
            "${bl_logging_levels[@]}"
        return 1
    fi
    if [ "$bl_logging_level" -ge "$level_index" ]; then
        bl.logging.plain "$(bl_logging_get_prefix "$level" "$level_index")" "$@"
    fi
}
alias bl.logging.critical='bl_logging_log critical'
alias bl.logging.debug='bl_logging_log debug'
alias bl.logging.error='bl_logging_log error'
alias bl.logging.info='bl_logging_log info'
alias bl.logging.verbose='bl_logging_log verbose'
alias bl.logging.warn='bl_logging_log warn'
alias bl.logging.warning='bl.logging.warn'
bl_logging_output_to_saved_file_descriptors=false
bl_logging_off=false
alias bl.logging.cat=bl_logging_cat
bl_logging_cat() {
    $bl_logging_off && return 0
    if [[ "$bl_logging_log_file" != "" ]]; then
        cat "$@" >> "$bl_logging_log_file"
        if $bl_logging_tee_fifo_active; then
            cat "$@"
        fi
    else
        if $bl_logging_output_to_saved_file_descriptors; then
            cat "$@" 1>&3 2>&4
        else
            cat "$@"
        fi
    fi
}
alias bl.logging.plain=bl_logging_plain
bl_logging_plain() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    >>> bl.logging.set_level info
    >>> bl.logging.set_commands_level debug
    >>> bl.logging.debug "not shown"
    >>> echo "not shown"
    >>> bl.logging.plain "shown"
    shown
    '
    $bl_logging_off && return 0
    if [[ "$bl_logging_log_file" != "" ]]; then
        echo -e "$@" >> "$bl_logging_log_file"
        if $bl_logging_tee_fifo_active; then
            echo -e "$@"
        fi
    else
        if $bl_logging_output_to_saved_file_descriptors; then
            echo -e "$@" 1>&3 2>&4
        else
            echo -e "$@"
        fi
    fi
}
bl_logging_commands_output_saved=std
alias bl.logging.set_command_output_off=bl_logging_set_command_output_off
bl_logging_set_command_output_off() {
    bl_logging_commands_output_saved="$bl_logging_options_command"
    bl_logging_set_file_descriptors "$bl_logging_log_file" \
        --logging="$bl_logging_options_log" --commands="off"
}
alias bl.logging.set_command_output_on=bl_logging_set_command_output_on
bl_logging_set_command_output_on() {
    bl.logging.set_file_descriptors "$bl_logging_log_file" \
        --logging="$bl_logging_options_log" \
        --commands="std"
}
bl_logging_log_file=''
# shellcheck disable=SC2034
bl_logging_tee_fifo=''
bl_logging_tee_fifo_dir=''
bl_logging_tee_fifo_active=false
bl_logging_file_descriptors_saved=false
bl_logging_commands_tee_fifo_active=false
bl_logging_options_log=std
bl_logging_options_command=std
alias bl.logging.set_log_file=bl_logging_set_log_file
bl_logging_set_log_file() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    >>> local test_file="$(mktemp)"
    >>> bl.logging.plain "test_file:" >"$test_file"
    >>> bl.logging.set_log_file "$test_file"
    >>> bl.logging.plain logging
    >>> bl.logging.set_log_file "$test_file"
    >>> echo echo
    >>> bl.logging.set_log_file ""
    >>> bl.logging.cat "$test_file"
    >>> rm "$test_file"
    logging
    echo
    test_file:
    logging
    echo

    >>> bl.logging.set_commands_level debug
    >>> bl.logging.set_level debug
    >>> local test_file="$(mktemp)"
    >>> bl.logging.plain "test_file:" >"$test_file"
    >>> bl.logging.set_log_file "$test_file"
    >>> bl.logging.plain 1
    >>> bl.logging.set_log_file ""
    >>> bl.logging.set_log_file "$test_file"
    >>> bl.logging.plain 2
    >>> bl.logging.set_log_file ""
    >>> bl.logging.cat "$test_file"
    >>> rm "$test_file"
    1
    2
    test_file:
    1
    2
    '
    [[ "$bl_logging_log_file" == "$1" ]] && return 0
    bl.logging.set_file_descriptors ""
    [[ "$1" == "" ]] &&  return 0
    bl.logging.set_file_descriptors "$1" --commands=tee --logging=tee
}
alias bl.logging.set_file_descriptors=bl_logging_set_file_descriptors
bl_logging_set_file_descriptors() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    >>> local test_file="$(mktemp)"
    >>> bl.logging.plain "test_file:" >"$test_file"
    >>> bl.logging.set_file_descriptors ""
    >>> bl.logging.cat "$test_file"
    >>> rm "$test_file"
    test_file:

    >>> local test_file="$(mktemp)"
    >>> bl.logging.set_file_descriptors "$test_file"
    >>> bl.logging.set_file_descriptors ""
    >>> echo "test_file:" >"$test_file"
    >>> bl.logging.cat "$test_file"
    >>> rm "$test_file"
    test_file:

    >>> local test_file="$(mktemp)"
    >>> bl.logging.plain "test_file:" >"$test_file"
    >>> bl.logging.set_file_descriptors "$test_file" --logging=tee
    >>> bl.logging.plain foo
    >>> bl.logging.set_file_descriptors ""
    >>> bl.logging.cat "$test_file"
    >>> rm "$test_file"
    foo
    test_file:
    foo

    >>> local test_file="$(mktemp)"
    >>> bl.logging.plain "test_file:" >"$test_file"
    >>> bl.logging.set_file_descriptors "$test_file" --logging=off --commands=file
    >>> bl.logging.plain not shown
    >>> echo foo
    >>> bl.logging.set_file_descriptors ""
    >>> bl.logging.cat "$test_file"
    >>> rm "$test_file"
    test_file:
    foo

    >>> local test_file="$(mktemp)"
    >>> bl.logging.plain "test_file:" >"$test_file"
    >>> bl.logging.set_file_descriptors "$test_file" --logging=off
    >>> bl.logging.plain not shown
    >>> echo foo
    >>> bl.logging.set_file_descriptors ""
    >>> bl.logging.cat "$test_file"
    >>> rm "$test_file"
    foo
    test_file:

    >>> local test_file="$(mktemp)"
    >>> bl.logging.plain "test_file:" >"$test_file"
    >>> bl.logging.set_file_descriptors "$test_file" --commands=tee
    >>> bl.logging.plain logging
    >>> echo echo
    >>> bl.logging.set_file_descriptors ""
    >>> bl.logging.cat "$test_file"
    >>> rm "$test_file"
    logging
    echo
    test_file:
    echo

    >>> local test_file="$(mktemp)"
    >>> bl.logging.plain "test_file:" >"$test_file"
    >>> bl.logging.set_file_descriptors "$test_file" --commands=file
    >>> bl.logging.plain logging
    >>> echo echo
    >>> bl.logging.set_file_descriptors ""
    >>> bl.logging.cat "$test_file"
    >>> rm "$test_file"
    logging
    test_file:
    echo

    >>> local test_file="$(mktemp)"
    >>> bl.logging.plain "test_file:" >"$test_file"
    >>> bl.logging.set_file_descriptors "$test_file" --logging=file --commands=file
    >>> bl.logging.plain logging
    >>> echo echo
    >>> bl.logging.set_file_descriptors ""
    >>> bl.logging.cat "$test_file"
    >>> rm "$test_file"
    test_file:
    logging
    echo

    >>> local test_file="$(mktemp)"
    >>> bl.logging.plain "test_file:" >"$test_file"
    >>> bl.logging.set_file_descriptors "$test_file" --logging=file --commands=file
    >>> bl.logging.plain logging
    >>> echo echo
    >>> bl.logging.set_file_descriptors ""
    >>> bl.logging.cat "$test_file"
    >>> rm "$test_file"
    test_file:
    logging
    echo

    >>> local test_file="$(mktemp)"
    >>> bl.logging.plain "test_file:" >"$test_file"
    >>> bl.logging.set_file_descriptors "$test_file" --logging=file --commands=tee
    >>> bl.logging.plain logging
    >>> echo echo
    >>> bl.logging.set_file_descriptors ""
    >>> bl.logging.cat "$test_file"
    >>> rm "$test_file"
    echo
    test_file:
    logging
    echo

    >>> local test_file="$(mktemp)"
    >>> bl.logging.plain "test_file:" >"$test_file"
    >>> bl.logging.set_file_descriptors "$test_file" --logging=file --commands=off
    >>> bl.logging.plain logging
    >>> echo echo
    >>> bl.logging.set_file_descriptors ""
    >>> bl.logging.cat "$test_file"
    >>> rm "$test_file"
    test_file:
    logging

    >>> local test_file="$(mktemp)"
    >>> bl.logging.plain "test_file:" >"$test_file"
    >>> bl.logging.set_file_descriptors "$test_file" --logging=tee --commands=tee
    >>> bl.logging.plain logging
    >>> echo echo
    >>> bl.logging.set_file_descriptors ""
    >>> bl.logging.cat "$test_file"
    >>> rm "$test_file"
    logging
    echo
    test_file:
    logging
    echo

    Test exit handler
    >>> local test_file fifo
    >>> test_file="$(mktemp)"
    >>> fifo=$(bl.logging.set_file_descriptors "$test_file" --commands=tee; \
    >>>    echo $bl.logging.tee_fifo)
    >>> [ -p "$fifo" ] || echo fifo deleted
    >>> rm "$test_file"
    fifo deleted
    '
    bl.arguments.set "$@"
    # one off "std off tee file"
    local options_log options_command
    bl.arguments.get_keyword --logging options_log
    bl.arguments.get_keyword --commands options_command
    [[ "${options_log-}" == "" ]] && options_log=std
    [[ "${options_command-}" == "" ]] && options_command=std
    bl_logging_options_log="$options_log"
    bl_logging_options_command="$options_command"
    set -- "${bl_arguments_new[@]:-}"
    local log_file="$1"

    bl_logging_off=false
    # restore
    if $bl_logging_file_descriptors_saved; then
        exec 1>&3 2>&4 3>&- 4>&-
        bl_logging_file_descriptors_saved=false
    fi
    [ -p "$bl_logging_tee_fifo" ] && rm -rf "$bl_logging_tee_fifo_dir"
    bl_logging_commands_tee_fifo_active=false
    bl_logging_tee_fifo_active=false
    bl_logging_output_to_saved_file_descriptors=false

    if [[ "$log_file" == "" ]]; then
        bl_logging_log_file=""
        [[ "$bl_logging_options_log" == "tee" ]] && return 1
        [[ "$bl_logging_options_command" == "tee" ]] && return 1
        if [[ "$bl_logging_options_log" == "off" ]]; then
            bl_logging_off=true
        fi
        if [[ "$bl_logging_options_command" == "off" ]]; then
            exec 3>&1 4>&2
            bl_logging_file_descriptors_saved=true
            exec &>/dev/null
            bl_logging_output_to_saved_file_descriptors=true
        fi
        return 0
    fi
    # It's guaranteed that we have a log file from here on.
    if ! $bl_logging_file_descriptors_saved; then
        # save /dev/stdout and /dev/stderr to &3, &4
        exec 3>&1 4>&2
        bl_logging_file_descriptors_saved=true
    fi

    if [[ "$bl_logging_options_log" == tee ]]; then
        if [[ "$bl_logging_options_command" != "tee" ]]; then
            bl_logging_log_file="$log_file"
            bl_logging_tee_fifo_active=true
        fi
    elif [[ "$bl_logging_options_log" == "stdout" ]]; then
        true
    elif [[ "$bl_logging_options_log" == "file" ]]; then
        bl_logging_log_file="$log_file"
    elif [[ "$bl_logging_options_log" == "off" ]]; then
        bl_logging_off=true
    fi
    if [[ "$bl_logging_options_command" == "tee" ]]; then
        bl_logging_tee_fifo_dir="$(mktemp --directory --suffix rebash-logging-fifo)"
        bl_logging_tee_fifo="$bl_logging_tee_fifo_dir/fifo"
        mkfifo "$bl_logging_tee_fifo"
        trap '[ -p "$bl_logging_tee_fifo" ] && rm -rf "$bl_logging_tee_fifo_dir"; exit' EXIT
        tee --append "$log_file" <"$bl_logging_tee_fifo" &
        exec 1>>"$bl_logging_tee_fifo" 2>>"$bl_logging_tee_fifo"
        bl_logging_commands_tee_fifo_active=true
        if [[ "$bl_logging_options_log" != tee ]]; then
            bl_logging_output_to_saved_file_descriptors=true
        fi
    elif [[ "$bl_logging_options_command" == "stdout" ]]; then
        true
    elif [[ "$bl_logging_options_command" == "file" ]]; then
        exec 1>>"$log_file" 2>>"$log_file"
        bl_logging_output_to_saved_file_descriptors=true
    elif [[ "$bl_logging_options_command" == "off" ]]; then
        exec 1>>/dev/null 2>>/dev/null
    fi
}
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
