#!/usr/bin/env bash
#
# Copyright (C) 2016  Samantha McVey <samantham@posteo.net>
# This file and project are licensed under the GPLv2 or greater at your choice.
# For more information view the license included or visit:
# https://www.gnu.org/licenses/gpl-2.0.html
#
# This script processes the output from ps-lsof which is a two column list, where
# the 1st and 2nd columns must be delimited by spaces. The first column of the
# input is the process name.  The second column is the file. It then compares
# the filename with the file at $DB_FILE which is a two column file delimited
# by spaces, the first column is the name of the package and the second is the
# filename which belongs to the package.

# Help
if [[ "${1}" = "-h" || "${1}" = "--help" ]]; then
	printf "pacman-ps: Shows running process names and the files they still have\n "
	printf "  open that have been changed or removed on disk and the packages which"
	printf " own those packages.\n"
	printf "command line options:\n  -q  quiet: don't print header\n  -s only print"
	printf " out packages and files changed on disk but not process names\n  -h or"
	printf " --help: shows this help\n"
	exit 0
elif [[ ! "${1}" = "-s" &&  ! "${1}" = "-q" && ! "${1}" = "" ]]; then
	printf "Unknown option! Try %s -h or --help to see help!\n" "${0}"
	exit 1
fi
# Function to check if we are using a temp database and if so remove it.
cleanuptemp() {
	if [ "${DB_TEMP_FILE}" = "1" ]; then
		rm "${LIST}"
	fi
}

DB_FILE="/var/cache/pacman-ps/files.db"
# Get the resolved filename of the currently running script
RUN=$(readlink -f "$0")
# Get the directory name that file is in
RUNDIR=$(dirname "${RUN}")
# If a file called ps-lsof is found in the same directory as pacman-ps use that
if [ -f "${RUNDIR}/ps-lsof" ]; then
	PS_LSOF_CMD="${RUNDIR}/ps-lsof -q"
# Otherwise, if we find a ps-lsof.sh file, use that to call ps-lsof
elif [ -f "${RUNDIR}/ps-lsof.sh" ]; then
	PS_LSOF_CMD="${RUNDIR}/ps-lsof.sh -q"
else
	echo "Could not find ps-lsof or ps-lsof.sh"
	echo "Make sure it is in the same folder as pacman-ps or pacman-ps.sh"
	exit 1
fi

# Get the output from ps-lsof and sort it so that 'join' will be happy
PS_LSOF_OUTPUT=$($PS_LSOF_CMD | sort -k 2,2)
# If ps-lsof doesn't output anything, our work here is done
if [ "${PS_LSOF_OUTPUT}" = "" ]; then
	exit 0
fi

# If we find the database file at $DB_FILE then use that
if [ -f "${DB_FILE}" ]; then
	LIST=${DB_FILE}
else
	# If we can't find it, print out that we are falling back to asking pacman
	# Unless we invoke -q (quiet)
	if [ ! "${1}" = "-q" ]; then
		echo "Could not find ${DB_FILE}"
		echo "Asking pacman for file listing using pacman -Ql"
	fi
	# Get a temp filename
	LIST=$(mktemp)
	trap "cleanuptemp"
	pacman -Ql | sort -u -k 2,2 > "${LIST}"
	DB_TEMP_FILE="1"
fi
# -s option will only print out packages and files but not processes
if [ "${1}" = "-s" ]; then
	$PS_LSOF_CMD | cut -d ' ' -f 2-99 | xargs -I '{}'  grep '{}' "${LIST}" | sort -u | (echo "PROCESS FILENAME"; cat) | column -t
	exit 0
fi

OUTPUT=$(join -j 2 <(printf "%s" "${PS_LSOF_OUTPUT}") <(cut -d ' ' -f 2-99 <(printf "%s" "${PS_LSOF_OUTPUT}") | xargs -P 8 -I '{}'  grep '{}' "${LIST}" | sort -u -k 2,2) )
# If there's no output just cleanup a temp file if there is one and exit
if [ "$OUTPUT" = "" ]; then
	cleanuptemp
	exit 0
fi

if [ "${1}" = "-q" ]; then
	printf "%s\n" "$OUTPUT" | column -t
else
	printf "FILENAME PROCESS PACKAGE\n%s\n" "$OUTPUT" | column -t
fi
cleanuptemp
exit 0
