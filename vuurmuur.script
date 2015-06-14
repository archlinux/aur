#!/bin/bash

VUURMUURPID='/run/vuurmuur.pid'
VUURMUURLOGPID='/run/vuurmuur_log.pid'
start() {
    IFNUM=`/usr/bin/vuurmuur_script --list --interface any | wc -l`
    if [ $IFNUM = 0 ]; then
        echo "Please configure Vuurmuur first by defining at least one interface."
        exit 1
    fi

    # load modules
    . /etc/vuurmuur/modules.conf
    for MODULE in `echo $MODULES_TO_LOAD`; do
        /sbin/modprobe $MODULE &>/dev/null
        if [ $? != 0 ]; then
            echo "Error when loading module $MODULE. Check log files."
            exit 1
        fi
    done

    # start vuurmuur daemon
    if [ ! -f $VUURMUURPID ]; then
        /usr/bin/vuurmuur -l
        if [ $? != 0 ]; then
            echo "Error when starting Vuurmuur daemon. Check log files."
            STATUS="failed"
        fi
    else
        PID=`cat $VUURMUURPID | cut -d " " -f 1`
        echo "Error when starting Vuurmuur daemon. Already running at pid $PID."
        STATUS="failed"
    fi

    # start vuurmuur log parsing daemon
    if [ ! -f $VUURMUURLOGPID ]; then
        /usr/bin/vuurmuur_log
        if [ $? != 0 ]; then
            echo "Error when starting Vuurmuur log parsing daemon. Check log files."
            STATUS="failed"
        fi
    else
        PID=`cat $VUURMUURLOGPID | cut -d " " -f 1`
        echo "Error when starting Vuurmuur log parsing daemon. Already running at pid $PID."
        STATUS="failed"
    fi

    # finalize
    if [ $STATUS = "failed" ]; then
        exit 1
    fi
}
stop() {
    # initialize
    echo "Stopping Vuurmuur Firewall"
    STATUS="ok"

    # stop vuurmuur log parsing daemon
    PID=`cat $VUURMUURLOGPID | cut -d " " -f 1`
    if [[ ! -z $PID ]] && kill "$PID" &>/dev/null; then
        rm -f $VUURMUURLOGPID
    else
        echo "Error when stopping Vuurmuur log parsing daemon. Check log files."
        STATUS="failed"
    fi

    # stop vuurmuur daemon
    PID=`cat $VUURMUURPID | cut -d " " -f 1`
    if [[ ! -z $PID ]] && kill "$PID" &>/dev/null; then
        rm -f $VUURMUURPID
    else
        echo "Error when stopping Vuurmuur daemon. Check log files."
        STATUS="failed"
    fi

    # finalize
    if [ $STATUS = "false" ]; then
        exit 1
    fi
}
restart() {
    $0 stop
    $0 start
}

case $1 in
    start|stop|restart) "$1" ;;
esac
