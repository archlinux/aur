#!/bin/sh
if [ "$2" = up ]; then
	# Trigger an immediate ticket renewal.
	pkill -x -ALRM 'k5start|krenew'
fi
