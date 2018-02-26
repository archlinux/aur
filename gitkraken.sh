#!/bin/sh

LD_PRELOAD=/usr/lib/libcurl-gnutls.so.3 /opt/gitkraken/gitkraken "$@"
