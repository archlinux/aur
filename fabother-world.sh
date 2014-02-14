#!/bin/sh

mkdir -p ~/.fabother-world/data

exec /usr/share/fabother-world/fabother-world \
     --datapath=$HOME/.fabother-world/data \
     --savepath=$HOME/.fabother-world "$@"
