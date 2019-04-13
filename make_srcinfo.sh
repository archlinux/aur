#!/usr/bin/env sh

makepkg --printsrcinfo \
	| sed 's#^\(pkg\(base\|name\)\) = .*$#\1 = openttd-version#g' \
	| tee .SRCINFO

