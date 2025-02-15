#!/usr/bin/env bash

set -eux

if [ "$#" -lt 1 ]; then
    exit 2
fi

KERNEL="${1%%[^0-9.]*}"
KERNEL_MAJOR="${1%%[^0-9]*}"

echo "$0: $PWD"
echo "URL: https://cdn.kernel.org/pub/linux/kernel/v${KERNEL_MAJOR}.x/linux-${KERNEL}.tar.xz"

[ -e "linux-${KERNEL}" ] && rm -rf "linux-${KERNEL}"

wget "https://cdn.kernel.org/pub/linux/kernel/v${KERNEL_MAJOR}.x/linux-${KERNEL}.tar.xz" -O- | tar -xvJf - --wildcards "linux-${KERNEL}/drivers/net/wireguard" "linux-${KERNEL}/K*" "linux-${KERNEL}/include/uapi/linux/"

[ -e kernel ] && rm -rf kernel
mv "linux-${KERNEL}" kernel
