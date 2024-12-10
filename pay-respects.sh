#!/bin/sh
if [ "$#" -gt 1 ]; then
	echo "_PR_LIB=/usr/lib/pay-respects:$HOME/.local/lib/pay-respects"
fi
/opt/pay-respects/bin/pay-respects "$@"
