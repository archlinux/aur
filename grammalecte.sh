#!/usr/bin/env bash

BIN_DIR='BINPATH'

if [ $# -lt 1 -o "${1}" = '-h' -o "${1}" = '--help' ]; then
	echo "Usage: $0 <cmd> [args]" >&2
	echo "  <cmd> may be one of: $(find "${BIN_DIR}" -type f -name '*.py' |sed -E 's@^.*/([^/]+)\.py$@\1@' |tr "\n" ' ' )" >&2
	exit 1
fi

COMMAND="${1}"
SCRIPT_PATH="${BIN_DIR}/${COMMAND}.py"
if [ ! -f "${SCRIPT_PATH}" ]; then
	echo "File missing at '${SCRIPT_PATH}'. Exiting." >&2
	exit 1
fi

shift
cd "${BIN_DIR}"
python "${SCRIPT_PATH}" $@

