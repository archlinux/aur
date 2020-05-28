#!/bin/bash
export LD_LIBRARY_PATH=/usr/lib/owon-vds-tiny
java \
  -Djava.library.path='/usr/lib/owon-vds-tiny' \
  -Duser.dir="$HOME/.owon-vds-tiny" \
  -cp '/usr/share/owon-vds-tiny/jar/*' \
  com.owon.vds.tiny.Main
