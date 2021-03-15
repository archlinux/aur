#!/bin/bash

pkgver="$1"
wget "https://get.gravitational.com/teleport-v${pkgver}-linux-amd64-bin.tar.gz"
wget "https://get.gravitational.com/teleport-v${pkgver}-linux-arm-bin.tar.gz"
wget "https://get.gravitational.com/teleport-v${pkgver}-linux-arm64-bin.tar.gz"

sha256sum teleport-v*-linux-*-bin.tar.gz
