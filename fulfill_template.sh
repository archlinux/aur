#!/bin/sh
#
# Usage: ./install_from_template.sh TEMPLATE_FILE OUTPUT_FILE OEM_FILE
#

_TEMPLATE_="${1}"
_OUTPUT_="${2}"
_OEMFILE_="${3}"

[ -z "${_TEMPLATE_}" -o -z "${_OUTPUT_}" -o -z "${_OEMFILE_}" ] && return 1


# Taken from uld/noarch/package_utils -> get_oem_field()

_get_oem_field() {
	[ -z "${1}" ] && return 1
	grep "^${1}=" "${_OEMFILE_}" 2>/dev/null | sed 's/\"//g' | sed "s/${1}=\(.*\)/\1/"
}


# Template files can use tab() function to insert '\t' symbol
# Taken from uld/noarch/scanner-script.pkg -> fill_full_template()

tab2() {
	# ${1} - number of tabs inserted
	local amount=${1}
	if [ -z "${amount}" ] ; then
		amount="1";
	fi
	for i in $(seq 1 ${amount}) ; do
		echo -n "    "
	done
}

tab() {
	# ${1} - number of tabs inserted
	local amount=${1}
	if [ -z "${amount}" ] ; then
		amount="1";
	fi
	for i in $(seq 1 ${amount}) ; do
		echo -n "    "
	done
}


# Callback variables

VID="$(_get_oem_field "VID")"
PIDS="$(_get_oem_field "PIDS")"


# Other variables

_TMP_FILE_="$(mktemp -t tmp_file.XXXX)"


# Script body

while read line; do
	eval echo \"${line}\" >> "${_TMP_FILE_}"
done < "${_TEMPLATE_}"

install -Dm755 "${_TMP_FILE_}" "${_OUTPUT_}"
rm "${_TMP_FILE_}"


# EOF

