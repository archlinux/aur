#!/bin/bash
LIBDIR="/usr/lib/ncm-desktop-for-linux-git"
exec electron "$LIBDIR/app.asar" "$@"

