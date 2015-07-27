#!/bin/sh

MC2XML=/usr/bin/mc2xml_x86
QEMU=/usr/bin/qemu-i386-static

if [ -z "${MC2XML}" ] || [ ! -x "${MC2XML}" ]; then
	echo "Cannot found mc2xml_x86"
	exit 1
fi
if [ -z "${QEMU}" ] || [ ! -x "${QEMU}" ]; then
	echo "Cannot found qemu-i386-static"
	exit 1
fi

"${QEMU}" "${MC2XML}" $*
exit $?

