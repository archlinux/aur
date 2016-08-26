#!/bin/sh
# Copyright (C) 2016  Samantha McVey <samantham@posteo.net>
# This file and project are licensed under the GPLv2 or greater at your choosing
#
# This script processes the output from ps-lsof which is a two column list, where
# the 1st and 2nd columns must be delimited by a space. The first column of the
# input is the process name.  The second column is the file. It then compares
# the filename with the file at $PACKAGELIST which is a two column file delimited
# by spaces, the first column is the name of the package and the second is the
# filename which belongs to the package.

PACKAGELIST="/var/cache/pacman-ps/files.db"
TEMPLIST="/tmp/pacman-ps/files.db"
TEMPDIR="/tmp/pacman-ps"
RUN=$(readlink -f "$0")
RUNDIR=$(dirname "${RUN}")
if [ -f "${RUNDIR}/ps-lsof" ]; then
	PS_LSOF="${RUNDIR}/ps-lsof"
elif [ -f "${RUNDIR}/ps-lsof.sh" ]; then
	PS_LSOF="${RUNDIR}/ps-lsof.sh"
else
	echo "Could not find ps-lsof or ps-lsof.sh"
	echo "Make sure it is in the same folder as pacman-ps or pacman-ps.sh"
	exit 1
fi

if [ -f "${PACKAGELIST}" ]; then
	# echo "Using ${PACKAGELIST} for the package and file list"
	LIST=${PACKAGELIST}
else
	echo "Could not find ${PACKAGELIST}"
	echo "Asking pacman for file listing using pacman -Ql"
	mkdir -p ${TEMPDIR}
	pacman -Ql > ${TEMPLIST}
	LIST=${TEMPLIST}
fi
#PACMANCHK="${RUNDIR}/ps-lsof.sh | cut -d ' ' -f 2-99 | xargs -I '{}'  grep '{}' ${LIST} | sort | column -t"

if [ "${1}" = "-s" ]; then
	$PS_LSOF | cut -d ' ' -f 2-99 | xargs -I '{}'  grep '{}' ${LIST} | sort | uniq | (echo "PROCESS FILENAME"; cat) | column -t
else
	mkdir -p ${TEMPDIR}
	$PS_LSOF | sort -k 2 > "${TEMPDIR}/process.txt"
	cut -d ' ' -f 2-99 < ${TEMPDIR}/process.txt | xargs -I '{}'  grep '{}' ${LIST} | sort | uniq | column -t | sort -k 2 > "${TEMPDIR}/package.txt"
	join -j 2 "${TEMPDIR}/process.txt" "${TEMPDIR}/package.txt" | column -t | sort -k 2 | uniq > "${TEMPDIR}/all.txt"
	echo "FILE PROCESS PACKAGE" > ${TEMPDIR}/head.txt
	cat ${TEMPDIR}/head.txt ${TEMPDIR}/all.txt | column -t
fi

if [ -d ${TEMPDIR} ]; then
	rm -rf ${TEMPDIR}
fi
