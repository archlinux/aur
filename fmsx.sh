#! /bin/bash
#
# fmsx.sh
# Copyright (C) 2013 Adrian Perez <aperez@igalia.com>
#
# Distributed under terms of the MIT license.
#

declare -a args=( )
declare romdir=/usr/lib/fmsx

while [[ $# -gt 0 ]] ; do
	arg=$1
	shift
	case ${arg} in
		-home)
			romdir=$2
			shift
			;;
		-h | -help | --help)
			args=( "${args[@]}" -help )
			;;
		*)
			args=( "${args[@]}" "${arg}" )
			;;
	esac
done

exec /usr/lib/fmsx/fmsx -home "${romdir}" "${args[@]}"

