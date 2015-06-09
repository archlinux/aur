#!/bin/bash
if [ $(which pkexec) ]; then
	pkexec --disable-internal-agent "/usr/bin/gsmartcontrol" "$@"
else
	/usr/bin/gsmartcontrol "$@"
fi
