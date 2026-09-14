#!/bin/sh
# Report every monitor profile ddccontrol fails to validate, without
# aborting at the first failure like `make check-db` does.
set -u

fail=0
total=0
for file in db/monitor/*.xml; do
  grep -q NOCHECKDB "$file" && continue
  name=${file##*/}
  name=${name%.xml}
  total=$((total + 1))
  ddccontrol -b db -v -v -i "$name" >/dev/null 2>&1 || {
    fail=$((fail + 1))
    echo "check-db: FAILED $name"
  }
done
echo "check-db: $fail / $total profiles failed"
