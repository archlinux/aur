#! /bin/bash
if [[ ${UID} -ne 0 && ${EUID} -ne 0 ]] ; then
	echo "$0: Must run as root." 1>&2
	exit 1
fi
exec /usr/bin/env \
	UID=$(id -u "${USER:-dqcache}") \
	GID=$(id -g "${GROUP:-dqcache}") \
	/usr/lib/dq/dqcache
