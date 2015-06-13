#!/bin/bash
# /usr/lib/systemd/system-sleep/tuxonice.sh

tuxonice_sys="/sys/power/tuxonice"
tuxoniceui_cmd="/usr/sbin/tuxoniceui"
tuxoniceui_vt=63
tuxoniceui_original_vt="/run/tuxoniceui_original_vt"

if [ "$1" = "pre" ]; then

    echo `fgconsole` > $tuxoniceui_original_vt
    chvt $tuxoniceui_vt

    if [ -d $tuxonice_sys -a -x $tuxoniceui_cmd ]; then
        if [ -c /dev/fb0 -a -d /etc/splash/tuxonice ]; then
            tuxoniceui_opt="-f"
        fi

        echo $tuxoniceui_cmd $tuxoniceui_opt > $tuxonice_sys/user_interface/program
    fi
fi


if [ "$1" = "post" ]; then
    chvt `< $tuxoniceui_original_vt`
    rm $tuxoniceui_original_vt
fi
