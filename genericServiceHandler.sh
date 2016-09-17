#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de

# This module provides generic service handling for each program supporting
# standard process signals.
# In general you only have to replace the string "generic" to you specific
# application name.

# Dependencies:

# - bash (or any bash like shell)
# - test - Check file types and compare values.
# - echo - Display a line of text.
# - cat  - Concatenate files and print on the standard output.
# - ps   - Report a snapshot of the current processes.
# - sed  - Stream editor for filtering and transforming text.
# - grep - Searches the named input files (or standard input if no files are
#          named, or if a single hyphen-minus (-) is given as file name) for
#          lines containing a match to the given PATTERN. By default, grep
#          prints the matching lines.
# - kill - Terminate a specified process.
# - rm   - Remove files or directories.
# - tail - Output the last part of files.
# - tee  - read from standard input and write to standard output and files

# Optional dependencies:

# - sudo - Perform action as another user.

# Needed for the LSBInitScripts specification.
### BEGIN INIT INFO
# Provides:          generic
# Required-Start:
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: see above
# Description:       see above
### END INIT INFO
__NAME__='genericServiceHandler'
# endregion
genericServiceHandler() {
    # Provides the main module scope.
    # region constants
    local NEED_CURRENT_LOCATION=false
    local USER_NAME=root
    local PROCESS_ID_FILE_PATH='/tmp/genericProcessID'
    local PROCESS_NAME_FILE_PATH='/tmp/genericProcessName'
    local PRE_START_SCRIPT=''
    local PROGRAM_START_FILE_PATH='/usr/bin/generic'
    local PROGRAM_START_ARGUMENTS="--log-level info ${@:2}"
    local PROGRAM_STOP_FILE_PATH="$PROGRAM_START_FILE_PATH"
    local PROGRAM_STOP_ARGUMENTS=''
    local PROGRAM_RELOAD_FILE_PATH="$PROGRAM_START_FILE_PATH"
    local PROGRAM_RELOAD_ARGUMENTS=''
    local OUTPUT_FILE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && \
        pwd)/output"
    # endregion
    # region controller
    if $NEED_CURRENT_LOCATION; then
        cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    fi
    local PROGRAM_CALL="$(echo \
        "$PROGRAM_START_FILE_PATH $PROGRAM_START_ARGUMENTS" | \
        sed --expression 's/^ *//' --expression 's/ *$//')"
    # Switch user if necessary and possible.
    local userName
    local userEnsured=false
    for userName in ${USER_NAME[*]}; do
        if [[ "$userName" == "$USER" ]]; then
            userEnsured=true
        elif grep "^${userName}:" /etc/passwd &>/dev/null; then
            echo "Use user \"$userName\"." && \
            sudo -u "$userName" "$0" "$@"
            return $?
        fi
    done
    if ! $userEnsured; then
        echo "User \"$USER_NAME\" couldn't be used."
        return 1
    fi
    mkdir --parents "$(dirname "$OUTPUT_FILE_PATH")" && \
    # Check if process id file is present but program isn't running under
    # expected id.
    if [ -f "$PROCESS_ID_FILE_PATH" ] && [[ "$(ps aux | grep \
        --extended-regexp "^[^ ]+ +$(cat "$PROCESS_ID_FILE_PATH")" | sed \
        --regexp-extended 's/^([^ ]+ +){10}//g')" != \
        "$(cat "$PROCESS_NAME_FILE_PATH")" ]]
    then
        echo "Warning: \"$(cat "$PROCESS_NAME_FILE_PATH")\" isn't running under process id \"$(cat "$PROCESS_ID_FILE_PATH")\". Deleting \"$PROCESS_ID_FILE_PATH\" and \"$PROCESS_NAME_FILE_PATH\"." && \
        rm --force "$PROCESS_ID_FILE_PATH" 2>&1 | tee --append \
            "$OUTPUT_FILE_PATH"
        rm --force "$PROCESS_NAME_FILE_PATH" 2>&1 | tee --append \
            "$OUTPUT_FILE_PATH"
    fi
    if [[ "$1" == start ]]; then
        # Check if requested service is already running.
        if [ -f "$PROCESS_ID_FILE_PATH" ]; then
            echo "\"$PROGRAM_CALL\" is already running under process id \"$(cat "$PROCESS_ID_FILE_PATH")\"." \
                2>&1 | tee --append "$OUTPUT_FILE_PATH"
        else
            eval "$PRE_START_SCRIPT" && \
            # NOTE: If we bind this program call to next program call via "&&"
            # the determined process id will take the id of this running bash
            # script instead of the wrapped program call.
            echo '-------------------------------------start-------------------------------------' \
                &>>"$OUTPUT_FILE_PATH"
            # Start service and save used process id and resulting process
            # name indicator.
            (eval "$PROGRAM_CALL" &>>"$OUTPUT_FILE_PATH" || \
                echo "Exit code: $?" &>>"$OUTPUT_FILE_PATH") &
            # NOTE: We have to wait a bit until the process was spawned.
            local parentProcessID="$!" && \
            sleep 1 && \
            # Determine children process because we have launched a sub shell.
            local processID="$(ps --ppid "$parentProcessID" | sed \
                --regexp-extended 's/^[^0-9]+//g' | grep --extended-regexp \
                --only-matching '^[0-9]+')" && \
            # Save spawned process id.
            [[ "$processID" ]] && echo "$processID" 1>"$PROCESS_ID_FILE_PATH" \
                2>&1 | tee --append "$OUTPUT_FILE_PATH" && \
            # Save spawned process name.
            echo "$(ps aux | grep --extended-regexp "^[^ ]+ +$(cat \
                "$PROCESS_ID_FILE_PATH")" | sed --regexp-extended \
                's/^([^ ]+ +){10}//g')" 1>"$PROCESS_NAME_FILE_PATH"
        fi
    elif [[ "$1" == stop ]]; then
        if [ -f "$PROCESS_ID_FILE_PATH" ]; then
            # NOTE: We have to use "PIPESTATUS" to avoid tee from shadowing
            # "kill's" return code.
            if [ "$PROGRAM_STOP_FILE_PATH" ]; then
                "$PROGRAM_STOP_FILE_PATH" $PROGRAM_STOP_ARGUMENTS 2>&1 | \
                    tee --append "$OUTPUT_FILE_PATH"
                local killReturnCode=$PIPESTATUS
            else
                # NOTE: "kill" could be a shell-builtin so long options may not
                # supported.
                kill -s SIGTERM -- "$(cat "$PROCESS_ID_FILE_PATH")" 2>&1 | \
                    tee --append "$OUTPUT_FILE_PATH"
                local killReturnCode=$PIPESTATUS
                if [[ $PIPESTATUS != 0 ]]; then
                    echo 'Signal "SIGTERM" doesn\t work trying a "SIGINT" signal' \
                        2>&1 | tee --append "$OUTPUT_FILE_PATH" &&
                    kill -s SIGINT -- "$(cat "$PROCESS_ID_FILE_PATH")" 2>&1 | \
                        tee --append "$OUTPUT_FILE_PATH"
                    local killReturnCode=$PIPESTATUS
                fi
            fi
            echo "Kill return code: $killReturnCode" &>> "$OUTPUT_FILE_PATH"
            if [[ $killReturnCode == 0 ]]; then
                # Remove process id and process name file if terminating
                # process was successful.
                rm --force "$PROCESS_ID_FILE_PATH" 2>&1 | tee --append \
                    "$OUTPUT_FILE_PATH"
                rm --force "$PROCESS_NAME_FILE_PATH" 2>&1 | tee --append \
                    "$OUTPUT_FILE_PATH"
            else
                (exit $killReturnCode)
            fi
        else
            echo "Stop signal for \"$PROGRAM_CALL\" triggered but pid file \"$PROCESS_ID_FILE_PATH\" isn't present." \
            2>&1 | tee --append "$OUTPUT_FILE_PATH"
        fi
    elif [[ "$1" == restart ]]; then
        "$__NAME__" stop && "$__NAME__" start
    elif [[ "$1" == status ]]; then
        if [ -f "$PROCESS_ID_FILE_PATH" ]; then
            echo "\"$PROGRAM_CALL\" is running under process id \"$(cat "$PROCESS_ID_FILE_PATH")\"."
        else
            echo "\"$PROGRAM_CALL\" isn't currently running."
        fi
        echo 'Last logging output was:' && \
        tail --lines 40 "$OUTPUT_FILE_PATH"
    elif [[ "$1" == reload ]]; then
        if [[ "$PROGRAM_RELOAD_FILE_PATH" == '' ]]; then
            kill -s SIGHUP -- "$(cat "$PROCESS_ID_FILE_PATH")" 2>&1 | tee \
                --append "$OUTPUT_FILE_PATH" && \
            (exit $PIPESTATUS)
        else
            eval "${PROGRAM_RELOAD_FILE_PATH} ${PROGRAM_RELOAD_ARGUMENTS}" \
                2>&1 | tee --append "$OUTPUT_FILE_PATH"
            (exit $?)
        fi
    else
        cat << EOF
$__NAME__ is a service handler for "$PROGRAM_CALL"

Usage "$0" [status|start|stop|restart|reload]"
EOF
    fi
    # endregion
    return $?
}
# region footer
if [[ "$0" == *"${__NAME__}.sh" ]]; then
    "$__NAME__" "$@"
    exit $?
fi
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
