#! /usr/bin/env bash

# SPDX-FileCopyrightText: 2020 TQ Tezos <https://tqtezos.com/>
#
# SPDX-License-Identifier: LicenseRef-MIT-TQ

# This script builds and installs libusb and hidapi libraries. It's required since alpine
# doesn't provide static versions for these libraries, thus we have to compile it ourselves.
set -euo pipefail

git clone --single-branch --branch v1.0.23 https://github.com/libusb/libusb.git --depth 1
cd libusb
autoreconf -fvi && ./configure && make && make install

git clone --single-branch --branch hidapi-0.9.0 https://github.com/libusb/hidapi.git --depth 1

cd hidapi
autoreconf -fvi && ./bootstrap && ./configure && make && make install

rm -rf libusb hidapi
