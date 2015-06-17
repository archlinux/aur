#!/bin/bash

set -e

type nft > /dev/null

if [ ! -d /etc/nftables ]
then
	echo "Rules directory /etc/nftables does not exist" >&2
	exit 1
fi

function usage() {
	echo "USAGE: $0 start|stop|restart"
}

function ctrl_c() {
	echo
	echo "nftables rules successfully applied"
	exit 0
}

function nft_clear_table() {
	nft flush table $1 $2
	nft list table $1 $2 | awk '/^[ \t]+chain/{ print $2 }' | xargs -r -L 1 nft delete chain $1 $2
}

function nft_delete_table() {
	nft_clear_table $1 $2
	if nft list table $1 $2 > /dev/null
	then
		nft delete table $1 $2
	fi
}

function nft_clear_protocol() {
	for T in $(nft list tables $1 | cut -d ' ' -f 2)
	do
		nft_delete_table $1 $T
	done
}


function nftables_start() {
	find /etc/nftables -maxdepth 1 -type f -print0 -name '*.rules' | \
		sort -z | xargs --null --no-run-if-empty --max-args=1 nft -f

	if [ -t 0 ]
	then
		echo "Please check networking connection and press Ctrl+C on success"
		trap ctrl_c INT

        	sleep 20

		echo "No response, flushing rules"
		nftables_stop
	fi
}

function nftables_stop() {
	for P in ip ip6 arp bridge
	do
        	nft_clear_protocol $P
	done
}

function nftables_restart() {
	nftables_stop
	nftables_start
}

case $1 in
	start)
		nftables_start
		;;

	stop)
		nftables_stop
		;;

	restart)
		nftables_restart
		;;
	*)
		usage
		exit 1
		;;
esac
