#!/bin/bash

ORIGINAL_DIR=/opt/deflemask
USER_DIR=~/.deflemask
UNIONFS_DIR=/tmp/deflemask-unionfs

echo "Launching DefleMask overlay on $UNIONFS_DIR. Your work and changes are saved to $USER_DIR"

mkdir -p $USER_DIR
mkdir -p $UNIONFS_DIR

unionfs -o cow -o relaxed_permissions $USER_DIR=RW:$ORIGINAL_DIR=RO $UNIONFS_DIR

cd $UNIONFS_DIR

./DefleMask $@

cd .. && fusermount -u $UNIONFS_DIR && rmdir $UNIONFS_DIR

exit $?
