#!/bin/sh

set -e

case $(uname) in
Darwin) platform=macos;;
Linux)  platform=linux;;
*) echo "Unknown platform: $(uname)"; exit 1;;
esac

case $(uname -m) in
x86_64)  architecture=x64;;
aarch64) architecture=arm64;;
*) echo "Unknown architecture: $(uname -m)" >&2; exit 2;;
esac

echo $platform-$architecture
