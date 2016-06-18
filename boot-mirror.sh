#!/bin/sh

n=2
while [ -d /boot$n ]; do
	rsync -ra --delete /boot/ /boot$n/
	n=$((n+1))
done
