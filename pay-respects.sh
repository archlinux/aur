#!/bin/sh
if [ "$#" -gt 1 ]; then
	SHELL=$(basename $SHELL)
	if [ "$SHELL" = "fish" ]; then
		echo "set -x _PR_LIB /usr/lib/pay-respects:$HOME/.local/lib/pay-respects"
	elif [ "$SHELL" = "nu" ]; then
		echo "env:_PR_LIB=/usr/lib/pay-respects:$HOME/.local/lib/pay-respects"
	else
		echo "_PR_LIB=/usr/lib/pay-respects:$HOME/.local/lib/pay-respects"
	fi
fi
/opt/pay-respects/bin/pay-respects "$@"
