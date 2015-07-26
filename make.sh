#!/bin/bash
#
# Copyright (C) 2013 Lubomir Krajcovic <lubomir.krajcovic@gmail.com>
#
# This file is free software.
# You can redistribute it and/or modify it under the terms of the GNU
# General Public License (GPL) as published by the Free Software
# Foundation, in version 2 or later.
# This software is  distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY of any kind.
#

# param #1 is the action
case "$1" in
	'clean')
		if [ -f ./Makefile ]; then
			make clean
			exit $?
		fi
		;;
	'make')
		# param #2 is the `uname -r` for desired kernel
		kernver="$2"
		kheaders="/usr/lib/modules/$kernver/build"
		# check headers
		if [ -z "${kernver}" ]; then
			echo "Cannot build, need kernel version, e.g. your current: `uname -r`"
			exit 1
		fi
		if [ ! -d "${kheaders}" ]; then
			echo "Cannot build for kernel $kernver, missing headers: $kheaders"
			exit 1
		fi
		# call automation friends
		./autogen.sh
		# build
		./configure --with-kbuild="${kheaders}"
		res=$?
		[ $res -ne 0 ] && exit $res
		make
		exit $?
		;;
	*)
		echo -e "Usage:\n$0 [ clean | make <kerner-version> ]"
		exit 1
		;;
esac
