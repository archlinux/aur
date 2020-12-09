#!/bin/sh
LD_PRELOAD="/usr/lib/baidunetdisk/libbrowserengine.so:/usr/lib/baidunetdisk/libkernel.so" exec electron9 /usr/lib/baidunetdisk/resources/app.asar "$@"
