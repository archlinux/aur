#!/bin/bash
# Usage: $0 [DATA_DIR] [NAME]
set -e
set -x
function variables() {
	NAME="${2:-multimc}"
	if [ "${1}" ]; then
		DATA_DIR="${1}"
	else
		if [ "${XDG_DATA_HOME}" ]; then
			DATA_DIR="${XDG_DATA_HOME}/${NAME}"
		elif [ -d "${HOME}/.local/share" ]; then
			DATA_DIR="${HOME}/.local/share/${NAME}"
		else
			DATA_DIR="${HOME}/.${NAME}"
		fi
	fi
	echo ${DATA_DIR}
}

function main() {
	variables $@
	mkdir --parents "${DATA_DIR}"
	/usr/lib/multimc5/MultiMC5 --dir "${DATA_DIR}" | \
	/usr/lib/multimc5/MultiMC --dir "${DATA_DIR}"
}
main $@
