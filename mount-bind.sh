#!/bin/bash

CONFIG_HOME="/etc/mount"

config=${1:-$CONFIG_HOME/bind.conf}

test -n $config || exit
test -f $config || exit

# =========================================================================== #

# usage: mount_check <mount point>
mount_check() {
	local point=$1
	#
	test -n $point || return 1
	test -d $point || return 1
	#
	while read entry; do
		result=$(echo $entry | cut -d' ' -f2)
		if [ "$result" == $point ]; then
				return 1
		fi
	done < /proc/self/mounts
}

# mount_bind <mount src> <mount dst>
mount_bind() {
	local msrc=$1 mdst=$2
	test -n "$msrc" || return 1
	test -n "$mdst" || return 1
	#
	test -d "$msrc" || return 1
	test -d "$mdst" || {
		mkdir -p $mdst
		echo "This folder create by mount, and need to delete!" > $mdst/.mount_status
	}
	#
	mount -o bind $msrc $mdst 2>/dev/null
}

# =========================================================================== #

while read line; do
	#
	test -n "$line" || exit
	#
	prefix=$(echo $line | cut -c 1)
	case $prefix in
	'#')    continue
	esac
	#
	msrc=$(echo $line | cut -d' ' -f1)
	mdst=$(echo $line | cut -d' ' -f2)
	#
	mount_check $mdst && mount_bind $msrc $mdst
	#
done < $config

