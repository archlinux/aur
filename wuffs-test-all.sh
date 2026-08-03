#!/bin/bash -eu

# Copyright 2018 The Wuffs Authors.
#
# Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
# https://www.apache.org/licenses/LICENSE-2.0> or the MIT license
# <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your
# option. This file may not be copied, modified, or distributed
# except according to those terms.
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

# Extracted from wuffs' `build-all.sh`:

if [ ! -e wuffs-root-directory.txt ]; then
  echo "$0 should be run from the Wuffs root directory."
  exit 1
fi

echo "Running  gen/bin/example-crc32"
JSON_THINGS_CRC32=$(gen/bin/example-crc32 < test/data/json-things.formatted.json)
if [ "$JSON_THINGS_CRC32" != "cdcc7e35" ]; then
  echo "example-crc32 failed on json-things data"
  exit 1
fi

# ----

echo "Running  gen/bin/example-jsonptr"
JSON_THINGS_CRC32=$(gen/bin/example-jsonptr < test/data/json-things.unformatted.json | gen/bin/example-crc32)
if [ "$JSON_THINGS_CRC32" != "cdcc7e35" ]; then
  echo "example-jsonptr failed on json-things data"
  exit 1
fi

# ----

echo "Running  gen/bin/example-convert-to-nia"
set +e
script/print-nia-checksums.sh | \
    diff --unified test/nia-checksums-of-data.txt /dev/stdin
if [ $? != 0 ]; then
  echo "Unexpected change in test/nia-checksums-of-data.txt"
  exit 1
fi
set -e

# ----

echo "Running  gen/bin/example-mzcat"
set +e
script/print-mzcat-checksums.sh | \
    diff --unified test/mzcat-checksums-of-data.txt /dev/stdin
if [ $? != 0 ]; then
  echo "Unexpected change in test/mzcat-checksums-of-data.txt"
  exit 1
fi
set -e

# ----

for f in gen/bin/fuzz-*; do
  echo "Running  $f"
  $f test/data > /dev/null
done
