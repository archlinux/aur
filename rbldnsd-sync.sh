#!/bin/bash

declare -A RSYNC
source /etc/conf.d/rbldnsd
cd /var/rbldnsd

umask 0027

for type in ${!RSYNC[@]}; do
	mkdir -p $type
	for file in ${RSYNC[$type]}; do
		base=${file##*/}
		rsync -uzvt $file $type/$base
	done
done

