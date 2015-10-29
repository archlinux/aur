#!/bin/bash
# Usage: $0 [DATA_DIR] [NAME]
set -e
set -x
function variables() {
	NAME="${2:-multimc5}"
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
function move() {
	for i in "${1}"; do
		mv "${i}" "${2}"
	done
}
function directories() {
	mkdir --parents "${DATA_DIR}"
	if [ -d "${HOME}/.${NAME}" ] && [ "${HOME}/.${NAME}" != "${DATA_DIR}" ]; then
		move "${HOME}/.${NAME}/" "${DATA_DIR}/"
		rmdir "${HOME}/.${NAME}"
	elif [ -d "${HOME}/.local/share/${NAME}" ] && [ "${HOME}/.local/share/${NAME}" != "${DATA_DIR}" ]; then
		move "${HOME}/.local/share/${NAME}" "${DATA_DIR}"
		rmdir "${HOME}/.local/share/${NAME}"
	elif [ -d "${XDG_DATA_HOME}/${NAME}" ] && [ "${XDG_DATA_HOME}/${NAME}" != "${DATA_DIR}" ] ; then
		move "${XDG_DATA_HOME}/${NAME}/" "${DATA_DIR}"
		rmdir "${XDG_DATA_HOME}/${NAME}"
	fi
}

function main() {
	variables $@
	directories
	#/usr/lib/multimc5/MultiMC5 --dir "${DATA_DIR}"
}
main $@
