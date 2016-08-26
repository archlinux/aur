#!/bin/env sh
# Copyright (C) 2016  Samantha McVey <samantham@posteo.net>
# This project and this file are licensed with the GPLv2 or greater, at your choice.
#
# This script is meant to be executed by the pacman-ps-post.hook and it receives
# a list of package names seperated by a newline from stdin.  It then will add
# the file listing to the CACHEDIR/files
CACHEDIR="/var/cache/pacman-ps"
xargs -I '{}' pacman -Ql '{}' >> ${CACHEDIR}/files.db
wait
mkdir -p /tmp/pacman-ps
sort -k 2,2 ${CACHEDIR}/files.db | uniq > /tmp/pacman-ps/files-temp.db
rm ${CACHEDIR}/files.db
mv /tmp/pacman-ps/files-temp.db ${CACHEDIR}/files.db
rm -rf /tmp/pacman-ps
