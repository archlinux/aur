#!/bin/sh
if [ "$#" -ge 1 ] && [ -z "$_PR_LIB" ]; then
	shell=$(basename "${SHELL:-sh}")
	LIB="/usr/lib/pay-respects"
	PM="pacman"
	case "$shell" in
	nu | nush | nushell)
		echo "\$env._PR_LIB = \"$LIB\""
		echo "\$env._PR_PACKAGE_MANAGER = \"$PM\""
		;;
	pwsh | powershell | ps)
		echo "\$env:_PR_LIB = \"$LIB\""
		echo "\$env:_PR_PACKAGE_MANAGER = \"$PM\""
		;;
	xonsh)
		echo "\$_PR_LIB = \"$LIB\""
		echo "\$_PR_PACKAGE_MANAGER = \"$PM\""
		;;
	elvish)
		echo "set E:_PR_LIB = '$LIB'"
		echo "set E:_PR_PACKAGE_MANAGER = '$PM'"
		;;
	*)
		echo "export _PR_LIB=$LIB"
		echo "export _PR_PACKAGE_MANAGER=$PM"
		;;
	esac
fi
/opt/pay-respects/bin/pay-respects "$@"
