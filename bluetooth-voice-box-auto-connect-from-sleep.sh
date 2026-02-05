#!/bin/bash

case $1/$2 in
    post/*)
        /usr/bin/bluetooth-voice-box-auto-connect | systemd-cat -t bluetooth-voice-box-auto-connect
        ;; # break case
esac

