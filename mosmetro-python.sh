#!/bin/sh

interface="$1" status="$2"

if [ "$status" == 'up' ]; then
	/usr/bin/mosmetro
fi
