#!/bin/bash

. /usr/lib/pm-utils/functions

case "$1" in
    hibernate|suspend)
        suspend2ui="/sys/power/tuxonice/user_interface/program"
        [ -e "${suspend2ui}" ] || exit $NA

        p="/usr/sbin/tuxoniceui"
        opt=""
        [ -d /etc/splash/tuxonice ] && opt=" -f"

        echo "${p}${opt}" > "${suspend2ui}"
        ;;
    *)
        exit $NA
        ;;
esac

exit $?
