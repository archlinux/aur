#!/bin/bash

TMP_PATH=/tmp/guildedupdate

rm -rf $TMP_PATH
mkdir -p $TMP_PATH
cd $TMP_PATH || exit

wget https://www.guilded.gg/downloads/Guilded-Linux.deb
hash=$(sha256sum Guilded-Linux.deb | awk '{ print $1 }')

ar x Guilded-Linux.deb
tar xzf control.tar.gz

version=$(awk '/^Version:/ { print $2 }' control | cut -d '-' -f1)

echo "sha256sum: $hash"
echo "version: $version"

rm -rf $TMP_PATH