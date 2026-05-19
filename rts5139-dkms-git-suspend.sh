#!/bin/bash
# unload rts5139 before suspend, reload afterwards

case $1 in
	pre)
		rmmod rts5139
		;;
	post)
		modprobe rts5139
		;;
esac
