#!/bin/sh
export ELECTRON_IS_DEV=0
exec electron@electronversion@ /usr/lib/joplin/app/ $@
