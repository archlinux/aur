#!/bin/sh
if [ "$#" -ge 1 ] && [ -z "$_PR_LIB" ]; then
	SHELL=$(basename $SHELL)
	LIB="/usr/lib/pay-respects"
	PM="pacman"
	if [ "$SHELL" = "nu" ]; then
		echo "env:_PR_LIB=$LIB"
		echo "env:_PR_PACKAGE_MANAGER=$PM"
	elif [[ "$SHELL" = "pwsh" ]]; then
		echo "\$env:_PR_LIB=\"$LIB\""
		echo "\$env:_PR_PACKAGE_MANAGER=\"$PM\""
	else
		echo "export _PR_LIB=$LIB"
		echo "export _PR_PACKAGE_MANAGER=$PM"
	fi
fi
/opt/pay-respects/bin/pay-respects "$@"
