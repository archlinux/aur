#!/bin/sh

S=~/.reminiscence
test -d $S || mkdir -p $S
exec /usr/bin/reminiscence.bin --datapath=/usr/share/reminiscence --savepath=$S
