#!/bin/sh

LD_PRELOAD=/usr/lib/libcurl-openssl-1.0.so.4.4.0 /opt/gitkraken/gitkraken "$@"
