#!/bin/sh
LD_PRELOAD=/usr/lib/libcurl.so.3 /opt/mssql-tools/bin/sqlcmd-version "$@"
