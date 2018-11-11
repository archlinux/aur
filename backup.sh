#!/bin/bash
# Example backup script

SERVER="/srv/craftbukkit"
FILENAME="$(date +%Y%m%d%H%M).tar.bzip2"

if [ ! -e "$SERVER/backup" ]; then
  (umask 007 && mkdir "$SERVER/backup")
fi
craftbukkit-save tar -cjf "$SERVER/backup/$FILENAME" -C "$SERVER" \
    world world_nether world_the_end
