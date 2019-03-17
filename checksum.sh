#!/bin/bash
[ -z "$1" ] && { echo "usage $0 <PKGVERSION>"; exit 1; }
PKGVER=$1
curl -sI https://d3ip0rje8grhnl.cloudfront.net/v$PKGVER/Inkdrop-$PKGVER-Linux.zip | grep x-amz-meta-md5sum | cut -d ' ' -f 2
