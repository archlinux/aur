#!/bin/bash
. /etc/icecream.conf

netname=
if test -n "${ICECREAM_NETNAME}"; then
    netname="-n ${ICECREAM_NETNAME}"
fi
logfile=""
if test -n "${ICECREAM_LOG_FILE}"; then
    touch ${ICECREAM_LOG_FILE}
    chown icecc:icecc ${ICECREAM_LOG_FILE}
    logfile="-l ${ICECREAM_LOG_FILE}"
fi

/usr/lib/icecream/sbin/icecc-scheduler -d ${netname} ${logfile} &>/dev/null
