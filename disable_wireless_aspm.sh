#!/bin/bash
#
# Disable ASPM for Marvell Wireles driver on Surface Pro 5 2017
#
# Original script by Luis R. Rodriguez <mcgrof@do-not-panic.com>
# Force enable ASPM L0 and L1 for all devices on Dell 9360 
# https://gist.github.com/baybal/b499fc5811a7073df0c03ab8da4be904
# BIG THANKS to HIM!
#
# Modified by P.I.Julius <me@pijulius.com>
# Modification include simply using one device and setting ASPM
# to disabled instead of enabled by default.
#
# IMPORTANT: you will need to run this script on every fresh start
# but it seems resume keeps the set value
#
# To use this script You will need for now to at least query your device
# lspci -vvv
#
# For example:
# 01:00.0 Ethernet controller: Marvell Technology Group Ltd. 88W8897 [AVASTAR] 802.11ac Wireless
#

PCIDEVICE="01:00.0"

# We'll only enable the last 2 bits by using a mask
# of :3 to setpci, this will ensure we keep the existing
# values on the byte.
#
# Hex  Binary  Meaning
# -------------------------
# 0    0b00    L0 only
# 1    0b01    L0s only
# 2    0b10    L1 only
# 3    0b11    L1 and L0s
ASPM_SETTING=0

function aspm_setting_to_string()
{
	case $1 in
	0)
		echo -e "\t${BLUE}L0 only${NORMAL}, ${RED}ASPM disabled${NORMAL}"
		;;
	1)
		;;
	2)
		echo -e "\t${GREEN}L1 only${NORMAL}"
		;;
	3)
		echo -e "\t${GREEN}L1 and L0s${NORMAL}"
		;;
	*)
		echo -e "\t${RED}Invalid${NORMAL}"
		;;
	esac
}

# Pretty colors
GREEN="\033[01;32m"
YELLOW="\033[01;33m"
NORMAL="\033[00m"
BLUE="\033[34m"
RED="\033[31m"
PURPLE="\033[35m"
CYAN="\033[36m"
UNDERLINE="\033[02m"

# we can surely read the spec to get a better value
MAX_SEARCH=20
SEARCH_COUNT=1
ASPM_BYTE_ADDRESS="INVALID"

PCIDEVICE_PRESENT=$(lspci | grep -c "$PCIDEVICE")

if [[ $(id -u) != 0 ]]; then
	echo "This needs to be run as root"
	exit 1
fi

if [[ $PCIDEVICE_PRESENT -eq 0 ]]; then
	echo "Device $PCIDEVICE is not present"
	exit
fi

# XXX: lspci -s some_device_not_existing does not return positive
# if the device does not exist, fix this upstream
function device_present()
{

	PRESENT=$(lspci | grep -c "$1")
	COMPLAINT="${RED}not present${NORMAL}"

	if [[ $PRESENT -eq 0 ]]; then
		if [[ $2 != "present" ]]; then
			COMPLAINT="${RED}disappeared${NORMAL}"
		fi

		echo -e "Device ${BLUE}${1}${NORMAL} $COMPLAINT" 
		return 1
	fi
	return 0
}

function find_aspm_byte_address()
{
	device_present $PCIDEVICE present
	if [[ $? -ne 0 ]]; then
		exit
	fi

	SEARCH=$(setpci -s $1 34.b)
	# We know on the first search $SEARCH will not be
	# 10 but this simplifies the implementation.
	while [[ $SEARCH != 10 && $SEARCH_COUNT -le $MAX_SEARCH ]]; do
		END_SEARCH=$(setpci -s $1 ${SEARCH}.b)

		# Convert hex digits to uppercase for bc
		SEARCH_UPPER=$(printf "%X" 0x${SEARCH})

		if [[ $END_SEARCH = 10 ]]; then
			ASPM_BYTE_ADDRESS=$(echo "obase=16; ibase=16; $SEARCH_UPPER + 10" | bc)
			break
		fi

		SEARCH=$(echo "obase=16; ibase=16; $SEARCH + 1" | bc)
		SEARCH=$(setpci -s $1 ${SEARCH}.b)

		let SEARCH_COUNT=$SEARCH_COUNT+1
	done

	if [[ $SEARCH_COUNT -ge $MAX_SEARCH ]]; then
		echo -e "Long loop while looking for ASPM word for $1"
		return 1
	fi
	return 0
}

function enable_aspm_byte()
{
	device_present $1 present
	if [[ $? -ne 0 ]]; then
		exit
	fi

	find_aspm_byte_address $1
	if [[ $? -ne 0 ]]; then
		return 1
	fi

	ASPM_BYTE_HEX=$(setpci -s $1 ${ASPM_BYTE_ADDRESS}.b)
	ASPM_BYTE_HEX=$(printf "%X" 0x${ASPM_BYTE_HEX})
	# setpci doesn't support a mask on the query yet, only on the set,
	# so to verify a setting on a mask we have no other optoin but
	# to do do this stuff ourselves.
	DESIRED_ASPM_BYTE_HEX=$(printf "%X" $(( (0x${ASPM_BYTE_HEX} & ~0x7) |0x${ASPM_SETTING})))

	if [[ $ASPM_BYTE_ADDRESS = "INVALID" ]]; then
		echo -e "No ASPM byte could be found for $(lspci -s $1)"
		return
	fi

	echo -e "$(lspci -s $1)"
	echo -en "\t${YELLOW}0x${ASPM_BYTE_ADDRESS}${NORMAL} : ${CYAN}0x${ASPM_BYTE_HEX}${GREEN} --> ${BLUE}0x${DESIRED_ASPM_BYTE_HEX}${NORMAL} ... "

	device_present $1 present
	if [[ $? -ne 0 ]]; then
		exit
	fi

	# Avoid setting if already set
	if [[ $ASPM_BYTE_HEX = $DESIRED_ASPM_BYTE_HEX ]]; then
		echo -e "[${GREEN}SUCESS${NORMAL}] (${GREEN}already set${NORMAL})"
		aspm_setting_to_string $ASPM_SETTING
		return 0
	fi

	# This only writes the last 3 bits
	setpci -s $1 ${ASPM_BYTE_ADDRESS}.b=${ASPM_SETTING}:3

	sleep 3

	ACTUAL_ASPM_BYTE_HEX=$(setpci -s $1 ${ASPM_BYTE_ADDRESS}.b)
	ACTUAL_ASPM_BYTE_HEX=$(printf "%X" 0x${ACTUAL_ASPM_BYTE_HEX})

	# Do not retry this if it failed, if it failed to set.
	# Likey if it failed its a good reason and you should look
	# into that.
	if [[ $ACTUAL_ASPM_BYTE_HEX != $DESIRED_ASPM_BYTE_HEX ]]; then
		echo -e "\t[${RED}FAIL${NORMAL}] (0x${ACTUAL_ASPM_BYTE_HEX})"
		return 1
	fi

	echo -e "\t[${GREEN}SUCCESS]${NORMAL}]"
	aspm_setting_to_string $ASPM_SETTING

	return 0
}

echo -e "${CYAN}Device${NORMAL}:"
enable_aspm_byte $PCIDEVICE
echo
