#!/bin/sh

# source application-specific settings
[ -f /etc/conf.d/nmead ] && . /etc/conf.d/nmead

if [ ! -z "$NMEAD_BAUD" ]; then
	NMEAD_OPTIONS+=" -b $NMEAD_BAUD"
fi

if [ ! -z "$NMEAD_TTY" ]; then
	NMEAD_OPTIONS+=" -i $NMEAD_TTY"
fi

if [ ! -z "$NMEAD_PORT" ]; then
	NMEAD_OPTIONS+=" -p $NMEAD_PORT"
fi

nmead $NMEAD_OPTIONS
