#!/usr/bin/bash
. /usr/lib/initcpio/init_functions
parse_cmdline </proc/cmdline
u=$(((32768+${RANDOM})*600))
[ -e /usr/bin/unshare ] && exec /usr/bin/env -i "TERM=$TERM" /usr/bin/unshare --time --boottime ${fakeuptimesec:-${u}} /sbin/init "$@"
exec /usr/bin/env -i "TERM=$TERM" /sbin/init "$@"
exec /sbin/init "$@"
