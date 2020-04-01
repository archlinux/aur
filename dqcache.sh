#! /bin/bash

: ${USER:=dqcache}
: ${GROUP:=dqcache}

if [[ ${UID} -ne 0 && ${EUID} -ne 0 ]] ; then
	echo "$0: Must run as root." 1>&2
	exit 1
fi

if [[ -z ${ROOT} ]] ; then
	echo "$0: Undefined variable ROOT." 1>&2
	exit 1
fi

if [[ ! -d ${ROOT}/dump ]] ; then
	mkdir -p "${ROOT}/dump"
	chown "${USER}:${GROUP}" "${ROOT}/dump"
fi

if [[ -z ${VERBOSELOG} || ${VERBOSELOG} -eq 0 ]] ; then
	exec &> /dev/null
fi

exec /usr/bin/env \
	UID=$(id -u "${USER}") \
	GID=$(id -g "${GROUP}") \
	/usr/lib/dq/dqcache
