#!/bin/bash

ulimit -c unlimited

cd /opt/wind/bin
export LD_PRELOAD=../wbrowser/libcef.so

if [ -e ../lib/libjemalloc.so ]
then
  export LD_PRELOAD=../lib/libjemalloc.so:$LD_PRELOAD
fi

export LD_LIBRARY_PATH=../lib:../lib/3rd
exit_code=123
while [ $exit_code -eq 123 ] ;do
  ./wmain
  exit_code=$?
done
