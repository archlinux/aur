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

# ulimit is needed as sometimes pulledpork.pl goes in infinite loop
( ulimit -t 60; /usr/bin/pulledpork.pl -P -c /etc/pulledpork/pulledpork.conf )

# restart snort
if systemctl is-active snort &>/dev/null
then
	systemctl restart snort
fi

# restart suricata
if systemctl is-active suricata &>/dev/null
then
	systemctl restart suricata
fi

# restart barnyard2
if systemctl is-active barnyard2 &>/dev/null
then
	systemctl restart barnyard2
fi
