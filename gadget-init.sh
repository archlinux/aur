#!/usr/bin/bash
source "$(dirname "$0")/functions.sh"
set -e
case "${1}" in
	start)
		mkdir "${GADGET}"
		cd "${GADGET}"
		echo "${ID_VENDOR}" > "idVendor"
		echo "${ID_PRODUCT}" > "idProduct"
		echo 0x0200 > "bcdUSB"
		mkdir "configs/a.1" "strings/0x409"
		_SER=true
		if [ "${SERIAL}" == machine ]
		then cat /etc/machine-id > "strings/0x409/serialnumber"||_SER=false
		elif [ "${SERIAL}" == serialno ]
		then get_cmdline androidboot.serialno > "strings/0x409/serialnumber"||_SER=false
		else _SER=false
		fi
		if ! "${_SER}"
		then echo "${SERIAL}" > "strings/0x409/serialnumber"||_SER=false
		fi
		echo "${MANFACTURER}" > "strings/0x409/manufacturer"
		echo "${PRODUCT}"     > "strings/0x409/product"
		echo 1 > "os_desc/use"
		echo 0x1 > "os_desc/b_vendor_code"
		echo MSFT100 > "os_desc/qw_sign"
		ln -s "configs/a.1" "os_desc/a.1"
		mkdir "configs/a.1/strings/0x409"
		echo "${CONFIGURATION}" > "configs/a.1/strings/0x409/configuration"
	;;
esac