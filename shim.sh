#!/bin/sh
LANG="${SUNLOGINREMOTE_LANG:-zh_CN}"
export LANG
exec /opt/sunloginremote/bin/sunloginremote "$@"
