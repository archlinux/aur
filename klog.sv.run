#!/bin/sh -e

svname=kernel

if [ ! -d /var/log/$svname ]
then
    mkdir /var/log/$svname
    chown root:root /var/log/$svname
    chmod 700 /var/log/$svname
fi

exec < /proc/kmsg svlogd -tt /var/log/$svname
