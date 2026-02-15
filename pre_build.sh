#!/bin/bash
set -e

kernel="${1%%-*}"

if [ -z "$kernel" ]; then
    echo "PRE_BUILD: no kernel version, skipping"
    exit 0
fi

files=(
  btusb.c
  btintel.h
  btrtl.h
  btbcm.h
  btmtk.h
)

echo "PRE_BUILD: downloading Bluetooth sources for kernel $kernel"

for f in "${files[@]}"; do
  curl -L -o "$f" -w "URL: %{url_effective}\n" \
    "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/plain/drivers/bluetooth/$f?h=v$kernel"
done

echo "PRE_BUILD: applying patch"
patch -p1 < add-rtl8761b.patch
