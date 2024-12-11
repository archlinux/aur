#!/bin/sh
if [ "$#" -gt 1 ]; then
	if [ -z "$_PR_LIB" ]; then
		SHELL=$(basename $SHELL)
		LIB="/usr/lib/pay-respects"
		if [ "$SHELL" = "nu" ]; then
			echo "env:_PR_LIB=$LIB"
		elif [[ "$SHELL" = "pwsh" ]]; then
			echo "\$env:_PR_LIB=\"$LIB\""
		else
			echo "export _PR_LIB=$LIB"
		fi
	fi
fi
/opt/pay-respects/bin/pay-respects "$@"
