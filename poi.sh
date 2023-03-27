#!/usr/bin/env sh
electron=@ELECTRON@
name=@PKGNAME@

exec /usr/bin/${electron} /usr/share/poi "$@"
