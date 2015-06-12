#!/bin/bash
. /etc/icecream.conf

if test -n "${ICECREAM_NETNAME}"; then
    netname="-n ${ICECREAM_NETNAME}"
fi
logfile=""
if test -n "${ICECREAM_LOG_FILE}"; then
    touch ${ICECREAM_LOG_FILE}
    chown icecc:icecc ${ICECREAM_LOG_FILE}
    logfile="-l ${ICECREAM_LOG_FILE}"
fi
nice=""
if test -n "${ICECREAM_NICE_LEVEL}"; then
    nice="--nice ${ICECREAM_NICE_LEVEL}"
fi
scheduler=""
if test -n "${ICECREAM_SCHEDULER_HOST}"; then
    scheduler="-s ${ICECREAM_SCHEDULER_HOST}"
fi
noremote=""
if test "${ICECREAM_ALLOW_REMOTE}" = "no" 2> /dev/null; then
    noremote="--no-remote"
fi
maxjobs=""
if test -n "${ICECREAM_MAX_JOBS}"; then
    if test "${ICECREAM_MAX_JOBS}" -eq 0 2> /dev/null; then
	    maxjobs="-m 1"
	    noremote="--no-remote"
    else
	    maxjobs="-m ${ICECREAM_MAX_JOBS}"
    fi
fi

/usr/lib/icecream/sbin/iceccd -d ${logfile} ${nice} ${scheduler} ${netname} -b "${ICECREAM_BASEDIR}" ${maxjobs} ${noremote}  &>/dev/null
