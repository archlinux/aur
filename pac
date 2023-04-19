#!/bin/bash

mkdir -p ~/.geph-blobs
cp $(which pac-real) ~/.geph-blobs
~/.geph-blobs/pac-real $@
