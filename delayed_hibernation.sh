#!/bin/bash
logtag="delayed_hibernation: "

if [ ! -f /etc/delayed_hibernation.conf ]; then
	echo "${logtag}Missing configuration file, aborting."
	exit 1
fi

ENABLE=$(grep "^[^#]" /etc/delayed_hibernation.conf | grep "ENABLE=" | awk -F'=' '{ print $2 }')
if [ "$ENABLE" = "" ]; then
	echo "${logtag}Missing enable parameter, aborting."
	exit 1
elif [ "$ENABLE" != "0" ] && [ "$ENABLE" != "1" ]; then
	echo "${logtag}Bad enable parameter, aborting."
	exit 1
fi

TIMEOUT=$(grep "^[^#]" /etc/delayed_hibernation.conf | grep "TIMEOUT=" | awk -F'=' '{ print $2 }')
if [ "$TIMEOUT" = "" ]; then
	echo "${logtag}Missing timeout parameter, aborting."
	exit 1
elif [[ ! "$TIMEOUT" =~ ^[0-9]+$ ]]; then
	echo "${logtag}Bad timeout parameter, aborting."
	exit 1
fi

if [ "$ENABLE" = "1" ]; then
	if [ "$2" = "suspend" ]; then
		curtime=$(date +%s)
		if [ "$1" = "pre" ]; then
			if [ -f /var/run/delayed_hibernation.fail ]; then
				echo "${logtag}Failed hibernation detected, skipping setting RTC wakeup."
			else
				echo "${logtag}Setting RTC wakeup..."
				echo "$curtime" > /var/run/delayed_hibernation.lock
				rtcwake -m no -s "$TIMEOUT"
			fi
		elif [ "$1" = "post" ]; then
			if [ -f /var/run/delayed_hibernation.fail ]; then
				rm /var/run/delayed_hibernation.fail
			fi
			sustime=$(cat /var/run/delayed_hibernation.lock)
			if [ $((curtime - sustime)) -ge "$TIMEOUT" ]; then
				echo "${logtag}Automatic resume detected, hibernating."
				systemctl hibernate || echo "${logtag}There has been an error during hibernation, suspending!" && touch /var/run/delayed_hibernation.fail && 
systemctl suspend
			else
				echo "${logtag}Manual resume detected, disabling RTC wakeup."
				rtcwake -m disable
			fi
			rm /var/run/delayed_hibernation.lock
		fi
	fi
fi
