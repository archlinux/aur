#!/bin/bash

INCLUDE="#include <cstdint>"

for dir in $(find ~/.cargo/registry/src/ -name 'librocksdb-sys-0.17.1*'); do
  blob_file_meta="$dir/rocksdb/db/blob/blob_file_meta.h"
  trace_record="$dir/rocksdb/include/rocksdb/trace_record.h"
  write_batch_base="$dir/rocksdb/include/rocksdb/write_batch_base.h"

  if ! grep -q "$INCLUDE" "$blob_file_meta"; then
    echo "fixing $blob_file_meta"
    echo
    sed -i '/#include <cassert>/a #include <cstdint>' "$blob_file_meta"
  else
    echo "blob_file_meta.h already fixed"
  fi

  if ! grep -q "$INCLUDE" "$trace_record"; then
    echo "fixing $trace_record"
    echo
    sed -i '/#pragma once/a #include <cstdint>' "$trace_record"
  else
    echo "trace_record.h already fixed"
  fi

  if ! grep -q "$INCLUDE" "$write_batch_base"; then
    echo "fixing $write_batch_base"
    echo
    sed -i '/#include <cstddef>/a #include <cstdint>' "$write_batch_base"
  else
    echo "write_batch_base.h already fixed"
  fi
done
