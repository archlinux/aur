#!/bin/bash
#
#AutoRestartNM
#
# Copyright (c) 2013 gee
#
# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU Library General Public License as published
# by the Free Software Foundation; either version 2, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

usage ()
{
	echo "AutoRestartNM 0.2 (C) 2013-2015 gee"
	echo "Usage:   restartNM [ADDRESS] (SLEEPTIME) (RETRIES)"
	echo ""
	echo "Mandatory argument:"
	echo "ADDRESS        The address you wish to ping to know if the your network is working as expected"
	echo ""
	echo "Optional arguments:"
	echo "SLEEPTIME      The time the script will sleep after failing the ping before retrying to see if it was just a glitch (default: 30s)"
	echo "RETRIES        The number of times you wish to retry pinging before restarting Network Manager (default: 1)"
}


ADDR=$1
SLEEPTIME=$2
RETRIES=$3

if [ -z "$ADDR" ]
then
	usage
	exit 1
fi

if [ -z "$SLEEPTIME" ]
then
	SLEEPTIME=30s
fi

if [ -z "$RETRIES" ]
then
	RETRIES=1
fi

LOOPTIMES=0
SYSNAME="autorestartNM"


while [ true ]
do
	echo $FIRST
	ping -c 4 $ADDR -q
	PING=$?
	echo $PING

	if [ $PING -eq 0 ]
	then
		exit 0
	elif [ $LOOPTIMES -ne $RETRIES ]
	then
		systemd-cat -t "$SYSNAME" echo "First ping failed, going to sleep for $SLEEPTIME."
		sleep $SLEEPTIME
		let LOOPTIMES++
	else
		systemd-cat -t "$SYSNAME" echo "Second ping failed, restarting the NM service."
		systemctl restart NetworkManager.service
		sleep $SLEEPTIME
		exit 0
	fi
done
