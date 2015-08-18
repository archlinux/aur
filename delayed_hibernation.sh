#!/bin/bash
logtag="delayed_hibernation: "

if [ ! -f /etc/delayed_hibernation.conf ]; then
	echo "${logtag}Missing configuration file, aborting."
	exit 1
fi

ENABLE=$(cat /etc/delayed_hibernation.conf | grep "^[^#]" | grep "ENABLE=" | awk -F'=' '{ print $2 }')
if [ $ENABLE = "" ]; then
	echo "${logtag}Missing enable parameter, aborting."
	exit 1
elif [ $ENABLE != "0" ] && [ $ENABLE != "1" ]; then
	echo "${logtag}Bad enable parameter, aborting."
	exit 1
fi

TIMEOUT=$(cat /etc/delayed_hibernation.conf | grep "^[^#]" | grep "TIMEOUT=" | awk -F'=' '{ print $2 }')
if [ $TIMEOUT = "" ]; then
	echo "${logtag}Missing timeout parameter, aborting."
	exit 1
elif [[ ! $TIMEOUT =~ ^[0-9]+$ ]]; then
	echo "${logtag}Bad timeout parameter, aborting."
	exit 1
fi

if [ $ENABLE = "1" ]; then
	if [ "$2" = "suspend" ]; then
		curtime=$(date +%s)
		if [ "$1" = "pre" ]; then
			echo "${logtag}Setting RTC wakeup..."
			echo "$curtime" > /var/run/delayed_hibernation.lock
			rtcwake -m no -s $TIMEOUT
		elif [ "$1" = "post" ]; then
			sustime=$(cat /var/run/delayed_hibernation.lock)
			if [ $(($curtime - $sustime)) -ge $TIMEOUT ]; then
				echo "${logtag}Automatic resume detected, hibernating."
				systemctl hibernate || echo "${logtag}There has been an error during hibernation, suspending!" && systemctl suspend
			else
				echo "${logtag}Manual resume detected, disabling RTC wakeup."
				rtcwake -m disable
			fi
			rm /var/run/delayed_hibernation.lock
		fi
	fi
fi
