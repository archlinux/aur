#!/bin/bash

#-----------------------------------------------------------------------------
_USER="freenet"
WRAPPER_CMD="/usr/bin/java-service-wrapper"
WRAPPER_CONF="/opt/freenet/wrapper.config"
PIDDIR="/run/freenet"
PIDFILE="$PIDDIR/freenet.pid"
TIMEOUT=30
#-----------------------------------------------------------------------------

fail() {
    printf "\e[1;31m>>> ERROR:\033[0m %s\n" "$*"
    exit 1
}

check_user() {
    if [[ "$(id -un)" != "$_USER" ]]; then
        if [[ ! -d "$PIDDIR" ]]; then
            install -dm700 "$PIDDIR"
            chown ${_USER}:${_USER} "$PIDDIR"
        fi
        SCRIPT_PATH="$(cd $(dirname $0) && pwd)/$(basename $0)"
        su - "$_USER" -c "${SCRIPT_PATH} $@"
        exit $?
    fi
}

init_vars() {
    [[ ! -r "$WRAPPER_CONF" ]] &&
        fail "Unable to read \$WRAPPER_CONF: ${WRAPPER_CONF}"
    [[ ! -x "$WRAPPER_CMD" ]] &&
        fail "Unable to find or execute \$WRAPPER_CMD: ${WRAPPER_CMD}"
    [[ ! $(grep -E ^_USER $0) && "$EUID" = "0" ]] &&
        fail "Attempting to start as root! Please edit $(basename $0) and set the variable \$_USER"
    [[ "$(id -un "$_USER")" != "$_USER" ]] &&
        fail "\$_USER does not exist: $_USER"
    COMMAND_LINE="\"$WRAPPER_CMD\" \"$WRAPPER_CONF\" wrapper.syslog.ident=\"freenet\" wrapper.name=\"freenet\""
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
            #echo "debug: pid:$pid get_pid:$(get_pid)"
            if [[ ! "$pid" ]]; then
                pid=$(get_pid)
                if [[ ! "$pid" ]]; then
                    echo "Removing stale pid file: $PIDFILE"
                    rm -f "$PIDFILE"
                fi
            else
                [[ "$pid" != "$(get_pid)" ]] &&
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
        eval $COMMAND_LINE
        [[ $? != 0 ]] && fail "Failed to launch the wrapper!"
    else
        echo "Freenet is already running"
    fi
}

_start() {
    if [[ ! "$pid" ]]; then
        echo -n "Starting Freenet"
        COMMAND_LINE+=" wrapper.daemonize=TRUE"
        eval $COMMAND_LINE
        [[ $? != 0 ]] && fail "Failed to launch the wrapper!"
        i=0
        while [[ ! "$pid" || $i < $TIMEOUT ]]; do
            echo -n "."
            sleep 1
            check_if_running
            ((i++))
        done
        [[ $(get_pid) ]] &&
            echo " done" || fail "timeout: Failed to start wrapper!"
    else
        echo "Freenet is already running"
    fi
}

_restart() {
    [[ "$pid" ]] &&
        kill -USR1 $(get_wrapper_pid) || echo "Freenet is not running"
}

_stop() {
    if [[ "$pid" ]]; then
        echo -n "Stopping Freenet"
        kill -TERM $pid
        [[ $? != 0 ]] && fail "Unable to stop Freenet: kill -TERM $pid"
        i=0
        while [[ "$pid" || $i > $TIMEOUT ]]; do
            echo -n "."
            sleep 1
            [[ ! $(get_pid) ]] && unset pid
            ((i++))
        done
        if [[ "$pid" ]]; then
            fail "timeout: Failed to stop wrapper!"
        else
            echo " done"
            [[ "$1" = 'start' ]] && _start
        fi
    else
        echo "Freenet is not running."
    fi
}

_graceful() {
    if [[ "$pid" ]]; then
        echo "Stopping Freenet gracefully..."
        kill -HUP $pid
        [[ $? != 0 ]] && fail "Unable to stop Freenet."
    else
        echo "Freenet is not running."
    fi
}

_status() {
    [[ "$pid" ]] &&
        echo "Freenet is running: PID:$pid" || echo "Freenet is not running."
}

_dump() {
    if [[ "$pid" ]]; then
        echo "Dumping threads..."
        kill -QUIT $pid
        [[ $? != 0 ]] &&
            fail "Failed to dump Freenet Service" || echo "Dumped Freenet Service."
    else
        echo "Freenet is not running."
    fi
}
#-----------------------------------------------------------------------------

check_user "$@"
init_vars
check_if_running

case "$1" in
     'console') _console
                ;;
       'start') _start
                ;;
        'stop') _stop
                ;;
    'graceful') _graceful
                ;;
     'restart') _restart
                ;;
      'status') _status
                ;;
        'dump') _dump
                ;;

    *)  echo "Usage: $(basename $0) [command]"
        echo
        echo "Commands:"
        echo "  console     Launch in the current console"
        echo "  start       Start in the background as a daemon process"
        echo "  stop        Stop if running as a daemon or in another console"
        echo "  graceful    Stop gracefully, may take up to 11 minutes for all tunnels to close"
        echo "  restart     Restart the JVM"
        echo "  status      Query the current status"
        echo "  dump        Request a Java thread dump if running"
        echo
        ;;
esac
exit 0

