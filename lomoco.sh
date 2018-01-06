#!/bin/bash

if [ -n "$BUSNUM" -a -n "$DEVNUM" ]; then
	. /etc/udev/lomoco_mouse.conf

	options=

	if [ -n "$LOGITECH_MOUSE_RESOLUTION" ]; then
		options="--$LOGITECH_MOUSE_RESOLUTION"
	fi

	case "$LOGITECH_MOUSE_SMS" in
		yes) options="$options --sms" ;;
		no) options="$options --no-sms" ;;
	esac

	if [ -n "$options" ]; then
		/usr/bin/lomoco -b $BUSNUM -d $DEVNUM $options
	fi

fi 2>&1 | /usr/bin/logger -t lomoco
