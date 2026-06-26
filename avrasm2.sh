#!/bin/sh
exec env AVR_INCLUDEPATH=/usr/share/avrasm2/inc /usr/lib/avrasm2 "$@"
