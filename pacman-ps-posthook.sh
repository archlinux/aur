#!/usr/bin/env sh
# Copyright (C) 2016  Samantha McVey <samantham@posteo.net>
# This file and project are licensed under the GPLv2 or greater at your choice.
# For more information view the license included or visit:
# https://www.gnu.org/licenses/gpl-2.0.html
#
# This script is meant to be executed by the pacman-ps-post.hook and it receives
# a list of package names seperated by a newline from stdin.  It then will add
# the file listing to the DB_DIR/files.db
DB_DIR="/var/cache/pacman-ps"
xargs -I '{}' pacman -Ql '{}' | sort -u -k 2,2 - ${DB_DIR}/files.db > ${DB_DIR}/files.db-
wait
rm ${DB_DIR}/files.db
mv ${DB_DIR}/files.db- ${DB_DIR}/files.db
