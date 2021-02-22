#!/usr/bin/bash

if
	[ ! -d $HOME/.thunderbird60 ]
then
	install -d -m 0700 $HOME/.thunderbird60
fi

exec /opt/thunderbird60/thunderbird --profile $HOME/.thunderbird60 "$@"
