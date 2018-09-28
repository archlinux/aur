#!/bin/sh
exec /usr/bin/erl -noinput -smp \
  -pa /usr/lib/erlang/lib/esdl-*/ebin /usr/lib/wings3d/ebin \
  -run wings_start start_halt ${1+"$@"}
