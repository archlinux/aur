#!/bin/sh
LD_PRELOAD=libcurl-gnutls.so.4 /opt/spotify/spotify "$@"
