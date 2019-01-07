#!/bin/bash

source /etc/conf.d/rbldnsd
cd /var/rbldnsd

printf -v O_BIND -- ' -b %s' ${BIND[@]}
printf -v O_ZONES -- "$ZONE:%s " `find -mindepth 2 -type f | awk -F/ '{printf "%s:%s/%s\n", $2, $2, $3}'`

OPTIONS="-u rbldnsd:rbldnsd $OPTIONS"
OPTIONS="-p /run/rbldnsd.pid $OPTIONS"
OPTIONS="-t $TTL $OPTIONS"
OPTIONS="-c $CHECK_TIME $OPTIONS"
OPTIONS="-r /var/rbldnsd $OPTIONS"

exec /usr/lib/rbldnsd/rbldnsd $O_BIND $OPTIONS $O_ZONES

