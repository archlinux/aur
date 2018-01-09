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
# region documentation
logging__doc__='
    The available log levels are:
    error critical warn info debug

    The standard loglevel is critical
    >>> logging.get_level
    >>> logging.get_commands_level
    critical
    critical
    >>> logging.error error-message
    >>> logging.critical critical-message
    >>> logging.warn warn-message
    >>> logging.info info-message
    >>> logging.debug debug-message
    +doctest_contains
    error-message
    critical-message

    If the output of commands should be printed, the commands_level needs to be
    greater than or equal to the log_level.
    >>> logging.set_level critical
    >>> logging.set_commands_level debug
    >>> echo foo

    >>> logging.set_level info
    >>> logging.set_commands_level info
    >>> echo foo
    foo

    Another logging prefix can be set by overriding "logging_get_prefix".
    >>> logging_get_prefix() {
    >>>     local level=$1
    >>>     echo "[myprefix - ${level}]"
    >>> }
    >>> logging.critical foo
    [myprefix - critical] foo

    "logging.plain" can be used to print at any log level and without the
    prefix.
    >>> logging.set_level critical
    >>> logging.set_commands_level debug
    >>> logging.plain foo
    foo

    "logging.cat" can be used to print files (e.g "logging.cat < file.txt")
    or heredocs. Like "logging.plain", it also prints at any log level and
    without the prefix.
    >>> echo foo | logging.cat
    foo
'
# endregion
# region variables
# logging levels from low to high
logging_levels=(
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
bl_logging_commands_level=$(bl.array.get_index 'critical' "${logging_levels[@]}")
bl_logging_level=$(bl.array.get_index 'critical' "${logging_levels[@]}")
# endregion
# region functions
logging_set_commands_level() {
    logging_commands_level=$(bl.array.get_index "$1" "${logging_levels[@]}")
    if [ "$logging_level" -ge "$logging_commands_level" ]; then
        logging_set_command_output_on
    else
        logging_set_command_output_off
    fi
}
alias logging.set_commands_level='logging_set_commands_level'
logging_get_level() {
    echo "${logging_levels[$logging_level]}"
}
alias logging.get_level='logging_get_level'
logging_get_commands_level() {
    echo "${logging_levels[$logging_commands_level]}"
}
alias logging.get_commands_level='logging_get_commands_level'
logging_set_level() {
    # shellcheck disable=SC2034,SC2016
    local __doc__='
    >>> logging.set_commands_level info
    >>> logging.set_level info
    >>> echo $logging_level
    >>> echo $logging_commands_level
    3
    3
    '
    logging_level=$(bl.array.get_index "$1" "${logging_levels[@]}")
    if [ "$logging_level" -ge "$logging_commands_level" ]; then
        logging_set_command_output_on
    else
        logging_set_command_output_off
    fi
}
alias logging.set_level='logging_set_level'
logging_get_prefix() {
    local level=$1
    local level_index=$2
    local color=${logging_levels_color[$level_index]}
    # shellcheck disable=SC2154
    local loglevel=${color}${level}${bl_cli_color_default}
    local path="${BASH_SOURCE[2]##./}"
    path=$(basename "$path")
    local prefix=[${loglevel}:"$path":${BASH_LINENO[1]}]
    echo "$prefix"
}
logging_log() {
    local level="$1"
    if [ "$level" = 'warn' ]; then
        level=warning
    fi
    shift
    local level_index
    level_index=$(bl.array.get_index "$level" "${logging_levels[@]}")
    if [ "$level_index" -eq -1 ]; then
        logging_log critical "loglevel \"$level\" not available, use one of: "\
            "${logging_levels[@]}"
        return 1
    fi
    if [ "$logging_level" -ge "$level_index" ]; then
        logging_plain "$(logging_get_prefix "$level" "$level_index")" "$@"
    fi
}
alias logging.log='logging_log'
alias logging.critical='logging_log critical'
alias logging.debug='logging_log debug'
alias logging.error='logging_log error'
alias logging.info='logging_log info'
alias logging.verbose='logging_log verbose'
alias logging.warn='logging_log warn'
alias logging.warning='logging_log warn'
logging_output_to_saved_file_descriptors=false
logging_off=false
logging_cat() {
    $logging_off && return 0
    if [[ "$logging_log_file" != "" ]]; then
        cat "$@" >> "$logging_log_file"
        if $logging_tee_fifo_active; then
            cat "$@"
        fi
    else
        if $logging_output_to_saved_file_descriptors; then
            cat "$@" 1>&3 2>&4
        else
            cat "$@"
        fi
    fi
}
alias logging.cat='logging_cat'
logging_plain() {
    local __doc__='
    >>> logging.set_level info
    >>> logging.set_commands_level debug
    >>> logging.debug "not shown"
    >>> echo "not shown"
    >>> logging.plain "shown"
    shown

    '
    $logging_off && return 0
    if [[ "$logging_log_file" != "" ]]; then
        echo -e "$@" >> "$logging_log_file"
        if $logging_tee_fifo_active; then
            echo -e "$@"
        fi
    else
        if $logging_output_to_saved_file_descriptors; then
            echo -e "$@" 1>&3 2>&4
        else
            echo -e "$@"
        fi
    fi
}
alias logging.plain='logging_plain'
logging_commands_output_saved="std"
logging_set_command_output_off() {
    logging_commands_output_saved="$logging_options_command"
    logging_set_file_descriptors "$logging_log_file" \
        --logging="$logging_options_log" --commands="off"
}
logging_set_command_output_on() {
    logging_set_file_descriptors "$logging_log_file" \
        --logging="$logging_options_log" \
        --commands="std"
}
logging_log_file=''
# shellcheck disable=SC2034
logging_tee_fifo=""
logging_tee_fifo_dir=""
logging_tee_fifo_active=false
logging_file_descriptors_saved=false
logging_commands_tee_fifo_active=false
logging_options_log="std"
logging_options_command="std"
logging_set_log_file() {
    local __doc__='
    >>> local test_file="$(mktemp)"
    >>> logging.plain "test_file:" >"$test_file"
    >>> logging.set_log_file "$test_file"
    >>> logging.plain logging
    >>> logging.set_log_file "$test_file"
    >>> echo echo
    >>> logging.set_log_file ""
    >>> logging.cat "$test_file"
    >>> rm "$test_file"
    logging
    echo
    test_file:
    logging
    echo

    >>> logging.set_commands_level debug
    >>> logging.set_level debug
    >>> local test_file="$(mktemp)"
    >>> logging.plain "test_file:" >"$test_file"
    >>> logging.set_log_file "$test_file"
    >>> logging.plain 1
    >>> logging.set_log_file ""
    >>> logging.set_log_file "$test_file"
    >>> logging.plain 2
    >>> logging.set_log_file ""
    >>> logging.cat "$test_file"
    >>> rm "$test_file"
    1
    2
    test_file:
    1
    2
    '
    [[ "$logging_log_file" == "$1" ]] && return 0
    logging_set_file_descriptors ""
    [[ "$1" == "" ]] &&  return 0
    logging_set_file_descriptors "$1" --commands=tee --logging=tee
}
alias logging.set_log_file='logging_set_log_file'
logging_set_file_descriptors() {
    local __doc__='

    >>> local test_file="$(mktemp)"
    >>> logging.plain "test_file:" >"$test_file"
    >>> logging_set_file_descriptors ""
    >>> logging.cat "$test_file"
    >>> rm "$test_file"
    test_file:

    >>> local test_file="$(mktemp)"
    >>> logging_set_file_descriptors "$test_file"
    >>> logging_set_file_descriptors ""
    >>> echo "test_file:" >"$test_file"
    >>> logging.cat "$test_file"
    >>> rm "$test_file"
    test_file:

    >>> local test_file="$(mktemp)"
    >>> logging.plain "test_file:" >"$test_file"
    >>> logging_set_file_descriptors "$test_file" --logging=tee
    >>> logging.plain foo
    >>> logging_set_file_descriptors ""
    >>> logging.cat "$test_file"
    >>> rm "$test_file"
    foo
    test_file:
    foo

    >>> local test_file="$(mktemp)"
    >>> logging.plain "test_file:" >"$test_file"
    >>> logging_set_file_descriptors "$test_file" --logging=off --commands=file
    >>> logging.plain not shown
    >>> echo foo
    >>> logging_set_file_descriptors ""
    >>> logging.cat "$test_file"
    >>> rm "$test_file"
    test_file:
    foo

    >>> local test_file="$(mktemp)"
    >>> logging.plain "test_file:" >"$test_file"
    >>> logging_set_file_descriptors "$test_file" --logging=off
    >>> logging.plain not shown
    >>> echo foo
    >>> logging_set_file_descriptors ""
    >>> logging.cat "$test_file"
    >>> rm "$test_file"
    foo
    test_file:

    >>> local test_file="$(mktemp)"
    >>> logging.plain "test_file:" >"$test_file"
    >>> logging_set_file_descriptors "$test_file" --commands=tee
    >>> logging.plain logging
    >>> echo echo
    >>> logging_set_file_descriptors ""
    >>> logging.cat "$test_file"
    >>> rm "$test_file"
    logging
    echo
    test_file:
    echo

    >>> local test_file="$(mktemp)"
    >>> logging.plain "test_file:" >"$test_file"
    >>> logging_set_file_descriptors "$test_file" --commands=file
    >>> logging.plain logging
    >>> echo echo
    >>> logging_set_file_descriptors ""
    >>> logging.cat "$test_file"
    >>> rm "$test_file"
    logging
    test_file:
    echo

    >>> local test_file="$(mktemp)"
    >>> logging.plain "test_file:" >"$test_file"
    >>> logging_set_file_descriptors "$test_file" --logging=file --commands=file
    >>> logging.plain logging
    >>> echo echo
    >>> logging_set_file_descriptors ""
    >>> logging.cat "$test_file"
    >>> rm "$test_file"
    test_file:
    logging
    echo

    >>> local test_file="$(mktemp)"
    >>> logging.plain "test_file:" >"$test_file"
    >>> logging_set_file_descriptors "$test_file" --logging=file --commands=file
    >>> logging.plain logging
    >>> echo echo
    >>> logging_set_file_descriptors ""
    >>> logging.cat "$test_file"
    >>> rm "$test_file"
    test_file:
    logging
    echo

    >>> local test_file="$(mktemp)"
    >>> logging.plain "test_file:" >"$test_file"
    >>> logging_set_file_descriptors "$test_file" --logging=file --commands=tee
    >>> logging.plain logging
    >>> echo echo
    >>> logging_set_file_descriptors ""
    >>> logging.cat "$test_file"
    >>> rm "$test_file"
    echo
    test_file:
    logging
    echo

    >>> local test_file="$(mktemp)"
    >>> logging.plain "test_file:" >"$test_file"
    >>> logging_set_file_descriptors "$test_file" --logging=file --commands=off
    >>> logging.plain logging
    >>> echo echo
    >>> logging_set_file_descriptors ""
    >>> logging.cat "$test_file"
    >>> rm "$test_file"
    test_file:
    logging

    >>> local test_file="$(mktemp)"
    >>> logging.plain "test_file:" >"$test_file"
    >>> logging_set_file_descriptors "$test_file" --logging=tee --commands=tee
    >>> logging.plain logging
    >>> echo echo
    >>> logging_set_file_descriptors ""
    >>> logging.cat "$test_file"
    >>> rm "$test_file"
    logging
    echo
    test_file:
    logging
    echo

    Test exit handler
    >>> local test_file fifo
    >>> test_file="$(mktemp)"
    >>> fifo=$(logging_set_file_descriptors "$test_file" --commands=tee; \
    >>>    echo $logging_tee_fifo)
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
    logging_options_log="$options_log"
    logging_options_command="$options_command"
    set -- "${arguments_new_arguments[@]:-}"
    local log_file="$1"

    logging_off=false
    # restore
    if $logging_file_descriptors_saved; then
        exec 1>&3 2>&4 3>&- 4>&-
        logging_file_descriptors_saved=false
    fi
    [ -p "$logging_tee_fifo" ] && rm -rf "$logging_tee_fifo_dir"
    logging_commands_tee_fifo_active=false
    logging_tee_fifo_active=false
    logging_output_to_saved_file_descriptors=false

    if [[ "$log_file" == "" ]]; then
        logging_log_file=""
        [[ "$logging_options_log" == "tee" ]] && return 1
        [[ "$logging_options_command" == "tee" ]] && return 1
        if [[ "$logging_options_log" == "off" ]]; then
            logging_off=true
        fi
        if [[ "$logging_options_command" == "off" ]]; then
            exec 3>&1 4>&2
            logging_file_descriptors_saved=true
            exec &>/dev/null
            logging_output_to_saved_file_descriptors=true
        fi
        return 0
    fi
    # It's guaranteed that we have a log file from here on.

    if ! $logging_file_descriptors_saved; then
        # save /dev/stdout and /dev/stderr to &3, &4
        exec 3>&1 4>&2
        logging_file_descriptors_saved=true
    fi

    if [[ "$logging_options_log" == tee ]]; then
        if [[ "$logging_options_command" != "tee" ]]; then
            logging_log_file="$log_file"
            logging_tee_fifo_active=true
        fi
    elif [[ "$logging_options_log" == "stdout" ]]; then
        true
    elif [[ "$logging_options_log" == "file" ]]; then
        logging_log_file="$log_file"
    elif [[ "$logging_options_log" == "off" ]]; then
        logging_off=true
    fi
    if [[ "$logging_options_command" == "tee" ]]; then
        logging_tee_fifo_dir="$(mktemp --directory --suffix rebash-logging-fifo)"
        logging_tee_fifo="$logging_tee_fifo_dir/fifo"
        mkfifo "$logging_tee_fifo"
        trap '[ -p "$logging_tee_fifo" ] && rm -rf "$logging_tee_fifo_dir"; exit' EXIT
        tee --append "$log_file" <"$logging_tee_fifo" &
        exec 1>>"$logging_tee_fifo" 2>>"$logging_tee_fifo"
        logging_commands_tee_fifo_active=true
        if [[ "$logging_options_log" != tee ]]; then
            logging_output_to_saved_file_descriptors=true
        fi
    elif [[ "$logging_options_command" == "stdout" ]]; then
        true
    elif [[ "$logging_options_command" == "file" ]]; then
        exec 1>>"$log_file" 2>>"$log_file"
        logging_output_to_saved_file_descriptors=true
    elif [[ "$logging_options_command" == "off" ]]; then
        exec 1>>/dev/null 2>>/dev/null
    fi
}
alias logging.set_file_descriptors='logging_set_file_descriptors'
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
