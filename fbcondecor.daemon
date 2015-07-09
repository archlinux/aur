#!/bin/bash

# /etc/rc.d/fbcondecor

# Set FbConDecor backgrounds
#

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/fbcondecor
. /usr/bin/splash-functions.sh

splash_setup force

retval=0
[ -z "${SPLASH_TTYS%% }" ] && retval=1
case "$1"
in start )
	if [ "${SPLASH_MODE_REQ}" != "off" ]; then
		stat_busy "Setting FBconDecor console images"
		for tty in ${SPLASH_TTYS}; do
			# avoid blinking on boot
			[[ "$( fbcondecor_ctl --tty=${tty} -c getstate )" == *\ on ]] && continue
			fbcondecor_set_theme ${SPLASH_THEME} ${tty} || retval=1
		done
		if [ $retval = 0 ]; then
			stat_done
		else
			stat_fail
		fi
	fi
;; stop )
	stat_busy "Disabling FBconDecor console images"
	for tty in ${SPLASH_TTYS}; do
		# avoid errors on restart
		[[ "$( fbcondecor_ctl --tty=${tty} -c getstate )" == *\ off ]] && continue
		fbcondecor_ctl --tty=${tty} -c off || retval=1
	done
	if [ $retval = 0 ]; then
		stat_done
	else
		stat_fail
	fi
;; restart )
	$0 stop
	sleep .1
	echo # don't swallow our status line
	$0 start
;; * )
	echo "usage: $0 {start|stop|restart}"
esac

exit 0

# EOF #
