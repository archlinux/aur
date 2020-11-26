#!/bin/bash
set -e
set -u

#Space Haven wirte settings and saves to the working directory
save_dir="${HOME}/.config/Space Haven"
mkdir -p "$save_dir"
cd "$save_dir"
java -Xmx3g -jar /opt/gog-space-haven/spacehaven.jar $@
