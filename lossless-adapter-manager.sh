#!/bin/sh
dest=~/.config/lossless-adapter-manager/lossless-adapter-manager
mkdir -p ~/.config/lossless-adapter-manager/ && \
/bin/cp -f "/opt/lossless-adapter-manager/lossless-adapter-manager" "$dest"
"$dest"