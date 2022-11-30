#!/usr/bin/bash
[ -e /usr/bin/unshare ] && exec /usr/bin/unshare --time --boottime ${fakeuptimesec:-44409600} /sbin/init "$@"
exec /sbin/init "$@"
