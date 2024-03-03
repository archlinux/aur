#!/bin/sh

export LD_PRELOAD=/usr/lib/libgtk4-layer-shell.so

exec /usr/share/io.Aylur.Astal/io.Aylur.Astal "$@"
