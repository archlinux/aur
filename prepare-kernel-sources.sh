#!/usr/bin/env bash

set -eux

KERNEL="${1%%[^0-9.]*}"
KERNEL_MAJOR="${1%%[^0-9]*}"

pwd

rm -vrf "linux-${KERNEL}" kernel

wget "https://cdn.kernel.org/pub/linux/kernel/v${KERNEL_MAJOR}.x/linux-${KERNEL}.tar.xz" -O- | tar -xvJf - --wildcards "linux-${KERNEL}/drivers/net/wireguard" "linux-${KERNEL}/K*" "linux-${KERNEL}/include/uapi/linux/"

mv "linux-${KERNEL}" kernel
