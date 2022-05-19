#!/usr/bin/bash
source "$(dirname "$0")/functions.sh"
set -e
cd "${GADGET}"
case "${1}" in
	start)
		if [ "${UDC}" == "auto" ]
		then	if _UDC="$(get_cmdline androidboot.usbcontroller)"
			then	echo "set udc to ${_UDC}"
				echo "${_UDC}" > UDC
			else	for i in /sys/class/udc/*
				do	[ -h "${i}" ]||continue
					_UDC="$(basename "$i")"||continue
					echo "set udc to ${_UDC}"
					echo "${_UDC}" > UDC
					exit
				done
			fi
		fi
	;;
	stop)
		echo "disable gadget"
		echo > UDC
	;;
esac