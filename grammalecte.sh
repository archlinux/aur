#!/usr/bin/env bash

BIN_DIR='BINPATH'

WRAPPER_NAME=$(basename "${0}")
if [ $# -lt 1 -o "${1}" = '-h' -o "${1}" = '--help' ]; then
	choices=$(find "${BIN_DIR}" -type f -name '*.py' |sed -E 's@^.*/([^/]+)\.py$@\1@')
	choices="${choices}\n$(echo "${choices}" |sed "s/${WRAPPER_NAME}-//g")"
	echo "Usage: ${WRAPPER_NAME} <cmd> [args]" >&2
	echo "  <cmd> may be one of: $(printf "${choices}\n" |sort -u |tr "\n" ' ')" >&2
	exit 1
fi

COMMAND="${1}"
SCRIPT_PATH="${BIN_DIR}/${COMMAND}.py"
[ ! -f "${SCRIPT_PATH}" ] && SCRIPT_PATH="${BIN_DIR}/${WRAPPER_NAME}-${COMMAND}.py"
if [ ! -f "${SCRIPT_PATH}" ]; then
	echo "File not found. Exiting." >&2
	exit 1
fi

shift
cd "${BIN_DIR}"
python "${SCRIPT_PATH}" $@

