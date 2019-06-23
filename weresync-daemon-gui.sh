#!/bin/sh

if command -v pkexec; then
	pkexec systemctl start weresync
else
	echo "pkexec not found, just attempting to start gui."
fi
/usr/bin/weresync-gui-only
if command -v pkexec; then
	pkexec systemctl stop weresync
fi
