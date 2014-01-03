#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

case $1 in
    start)
        stat_busy "Starting D-BUS system messagebus"
        if [[ ! -d /run/dbus ]] ; then
            install -m755 -g 81 -o 81 -d /run/dbus
        fi

        if ! dbus-daemon --system; then
            stat_fail
        else
            add_daemon dbus
            stat_done
        fi
        ;;
    stop)
        stat_busy "Stopping D-BUS system messagebus"
        if ! { [[ -f /run/dbus/pid ]] && kill $(</run/dbus/pid); }; then
            stat_fail
        else
            rm -f /run/dbus/pid
            rm_daemon dbus
            stat_done
        fi
        ;;
    restart)
        $0 stop
        sleep 1
        $0 start
        ;;
    reload)
        stat_busy "Reloading D-BUS configuration"
        if ! { [[ -f /run/dbus/pid ]] && dbus-send \
                --system --type=method_call \
                --dest=org.freedesktop.DBus \
                / org.freedesktop.DBus.ReloadConfig; }; then
            stat_fail
        else
            stat_done
        fi
        ;;
    *)
        echo "usage: $0 {start|stop|restart|reload}"
        ;;
esac
exit 0
