#!/bin/sh
GDK_BACKEND=x11 exec /usr/bin/erl -noinput -smp \
  -pa /usr/lib/wings3d/ebin \
  -run wings_start start_halt ${1+"$@"}
