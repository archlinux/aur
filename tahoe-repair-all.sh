#!/bin/sh
##########################################################
# Stop multiple instances from running simultaneously    #
# Nothing in this section should require editing         #
##########################################################
if [ -w /var/lock ]; then  # the default lock directory in Linux
        LOCKDIR="/var/lock/tahoe-repair-all.lck"
else
        LOCKDIR="/tmp/tahoe-repair-all.lck"   # but maybe not elsewhere...
fi
PIDFILE="${LOCKDIR}/PID"
ENO_SUCCESS=0;
ENO_GENERAL=1;
ENO_LOCKFAIL=2;
ENO_RECVSIG=3;

if mkdir "${LOCKDIR}"  > /dev/null 2>&1 ; then
       trap 'ECODE=$?;
       rm -rf "${LOCKDIR}"' 0
       touch $PIDFILE
       echo $$ > "${PIDFILE}"
       trap 'echo "ERROR: Killed by a signal $ECODE $ENO_RECVSIG" >&2
            exit ${ENO_RECVSIG}' 1 2 3 15
else
       # lock failed, check if it's stale
       OTHERPID="$(cat "${PIDFILE}")"

       if [ $? != 0 ]; then
               echo "ERROR: Another instance of `basename $0` is active with PID ${OTHERPID}" >&2
               exit ${ENO_LOCKFAIL}
       fi

       if ! kill -0 ${OTHERPID} >/dev/null 2>&1; then
               #stale lock, removing it and restarting
               echo "INFO: Removing stale PID ${OTHERPID}" >&2
               rm -rf ${LOCKDIR}
               echo "INFO: [`basename $0`] restarting" >&2
               exec "$0" "$@"
       else
               #lock is valid and OTHERPID is active
               echo "ERROR: Another instance of `basename $0` is active with PID ${OTHERPID}" >&2
               exit ${ENO_LOCKFAIL}
       fi
fi
##########################################################
for item in `tahoe list-aliases | cut -f 1 -d :`; do
	echo '*** '"$item"
	tahoe deep-check -v --repair --add-lease $item: | perl -pe 's/^/\t/'
	echo
done
