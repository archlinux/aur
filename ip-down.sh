#!/bin/sh

if [ -x "/usr/sbin/pdnsd-ctl" ]; then
	/usr/sbin/pdnsd-ctl config
fi
