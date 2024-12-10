#!/bin/sh
if [ "$#" -gt 1 ]; then
	echo "_PR_LIB=/usr/libexec/pay-respects:$HOME/.local/libexec/pay-respects"
fi
/opt/pay-respects/bin/pay-respects "$@"
