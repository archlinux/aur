#!/bin/sh

if [ -x "/usr/sbin/pdnsd-ctl" ]; then
	if [ -n "${DNS2}" ]; then
		DNS1="${DNS1},${DNS2}"
	fi
	/usr/sbin/pdnsd-ctl server dynamic up ${DNS1}
fi
