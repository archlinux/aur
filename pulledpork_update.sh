#!/bin/bash

if [ -z "$1" ]
then 
	echo "You must provide rule file path."
	exit 0
fi

if [ ! -f "$1" ]
then
	echo "Rule file $1 missing."
	exit 0
fi

if [ -f "/etc/pulledpork/update_via_pp2" ]
then
	# ulimit is needed as sometimes pulledpork.pl goes in infinite loop
	( ulimit -t 60; /usr/bin/pulledpork.pl -P -c /etc/pulledpork/pulledpork.conf )
else
	/usr/lib/pulledpork/pulledpork.py -c /etc/pulledpork/pulledpork3.conf
fi

# restart snort
if systemctl -q is-active snort.service &>/dev/null
then
	systemctl -q try-restart snort.service
fi

# restart suricata
if systemctl -q is-active suricata.service &>/dev/null
then
	systemctl -q try-restart suricata.service
fi

# restart barnyard2
if systemctl -q is-active barnyard2.service &>/dev/null
then
	systemctl -q try-restart barnyard2.service
fi
