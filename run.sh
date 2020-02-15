#!/usr/bin/env bash

#-----------------------------------------------------------------------------
_USER="freenet"
WRAPPER_CMD="/usr/bin/java-service-wrapper"
WRAPPER_CONF="/opt/freenet/wrapper.config"
PIDFILE="/run/freenet/freenet.pid"
TIMEOUT=120
#-----------------------------------------------------------------------------

fail() {
    printf "\e[1;31m>>> ERROR:\033[0m %s\n" "$*"
    exit 1
}

check_user() {
    if [[ "$(id -un)" != "$_USER" ]]; then
        SCRIPT_PATH="$(cd "$(dirname $0)" && pwd)/$(basename $0)"
        su - "$_USER" -c "${SCRIPT_PATH} $@"
        exit $?
    fi
}

init_vars() {
    [[ "$EUID" -eq 0 ]] &&
        fail "Attempting to start as root! You should never see this message, please report it"
    [[ ! -r "$WRAPPER_CONF" ]] &&
        fail "Unable to read \$WRAPPER_CONF: ${WRAPPER_CONF}"
    [[ ! -x "$WRAPPER_CMD" ]] &&
        fail "Unable to find or execute \$WRAPPER_CMD: ${WRAPPER_CMD}"
    COMMAND_LINE="\"$WRAPPER_CMD\" \"$WRAPPER_CONF\" wrapper.syslog.ident=\"freenet\" wrapper.name=\"freenet\" TZ=UTC"
}

get_wrapper_pid() {
    pgrep -u "$_USER" -f 'wrapper.name=freenet'
}
get_pid() {
    pgrep -u "$_USER" -f 'jar'
}

check_if_running() {
    unset pid
    if [[ -f "$PIDFILE" ]]; then
        if [[ -r "$PIDFILE" ]]; then
            pid=$(cat "$PIDFILE")
            if [[ ! "$pid" ]]; then
                pid=$(get_pid)
                if [[ ! "$pid" ]]; then
                    echo "Removing stale pid file: $PIDFILE"
                    rm -f "$PIDFILE"
                fi
            else
                [[ "$pid" -ne "$(get_pid)" ]] &&
                    fail "\$PIDFILE $PIDFILE differs from what is actually running!"
            fi
        else
            fail "Cannot read \$PIDFILE: $PIDFILE"
        fi
    fi
}

_console() {
    if [[ ! "$pid" ]]; then
        trap '' INT QUIT
        eval "$COMMAND_LINE" || fail "Failed to launch the wrapper!"
    else
        echo "Freenet is already running! (pid: $pid)"
    fi
}

_start() {
    if [[ ! "$pid" ]]; then
        echo -n "Starting Freenet"
        COMMAND_LINE+=" wrapper.daemonize=TRUE"
        eval "$COMMAND_LINE" || fail "Failed to launch the wrapper!"
        i=0
        while [[ ! "$pid" || $i -lt $TIMEOUT ]]; do
            echo -n "."
            sleep 1
            check_if_running
            ((i++))
        done
        [[ $(get_pid) ]] &&
            echo " done" || fail "timeout: Failed to start wrapper!"
    else
        echo "Freenet is already running! (pid: $pid)"
    fi
}

_restart() {
    [[ "$pid" ]] &&
        kill -USR1 "$(get_wrapper_pid)" || echo "Freenet is not running"
}

_stop() {
    if [[ "$pid" ]]; then
        echo "Stopping Freenet, this will take a few minutes"
        kill -TERM "$(get_wrapper_pid)" || fail "Unable to stop Freenet: kill -TERM $pid"
        i=0
        while [[ "$pid" || $i -gt $TIMEOUT ]]; do
            echo -n "."
            sleep 1
            [[ ! $(get_pid) ]] && unset pid
            ((i++))
        done
        [[ "$pid" ]] &&
            fail "timeout: Failed to stop wrapper! (pid: $pid)" || echo " done"
    else
        echo "Freenet is not running."
    fi
}

_dump() {
    if [[ "$pid" ]]; then
        kill -QUIT "$pid" || fail "Failed to dump Freenet Service"
        echo "Thread Dump is available in wrapper.log"
    else
        echo "Freenet is not running."
    fi
}
#-----------------------------------------------------------------------------

[[ "$1" != @(console|start|stop|restart|dump) ]] && {
    echo "Usage: $(basename $0) <command>"
    echo "Commands:"
    echo "  console     Launch in the current console"
    echo "  start       Start in the background as a daemon process"
    echo "  stop        Stop if running as a daemon or in another console"
    echo "  restart     Restart the JVM"
    echo "  dump        Request a Java thread dump"
    exit
}

check_user "$*"
check_if_running
init_vars

case "$1" in
     'console') _console
                ;;
       'start') _start
                ;;
        'stop') _stop
                ;;
     'restart') _restart
                ;;
        'dump') _dump
                ;;
esac
