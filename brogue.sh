#!/bin/bash
pkgname="broguelite"
local_path="${HOME}/.local/share/${pkgname}"

if [ ! -d "$local_path" ]; then
	mkdir $local_path
	ln -s /opt/${pkgname}/* "$local_path"
fi

cd $local_path
exec "./brogue"
