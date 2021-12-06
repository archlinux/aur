#!/usr/bin/env bash
set -euo pipefail

# Config
VERSION="11.0-1"

# Download build scripts
curl -o docker-static-build.sh https://raw.githubusercontent.com/serokell/tezos-packaging/v$VERSION/docker/docker-static-build.sh
curl -o Dockerfile https://raw.githubusercontent.com/serokell/tezos-packaging/v$VERSION/docker/build/Dockerfile
curl -o build-libusb-and-hidapi.sh https://raw.githubusercontent.com/serokell/tezos-packaging/v$VERSION/docker/build/build-libusb-and-hidapi.sh
curl -o build-tezos.sh https://raw.githubusercontent.com/serokell/tezos-packaging/v$VERSION/docker/build/build-tezos.sh
curl -o static_libs.patch https://raw.githubusercontent.com/serokell/tezos-packaging/v$VERSION/docker/build/static_libs.patch

# Download protocols.json
curl -o protocols.json https://raw.githubusercontent.com/serokell/tezos-packaging/v$VERSION/protocols.json

# Patch docker-static-build.patch
patch --forward --strip=1 --input="docker-static-build.patch"
