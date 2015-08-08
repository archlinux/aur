#!/bin/sh

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/shank2/lib/
export force_s3tc_enable=true
cd /opt/shank2/bin/
exec ./shank2 "$@"