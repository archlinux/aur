#!/bin/sh
# runs HP-15C tcl script in proper directory
exec env \
    -C /usr/lib/hp15c \
    HP15Cdocdir=/usr/share/doc/hp15c/ \
    /usr/bin/wish HP-15C.tcl "$@"
