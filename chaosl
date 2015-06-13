#!/bin/sh

# A wrapper for pre-registering the game
# Quasi-legit, see download page and readme

if [ ! -s ~/.spchaos/inf ]; then
    mkdir p ~/.spchaos
    echo -ne "\x04\xcb\x1a\x69\x65\x7e\x17\xe3" >  ~/.spchaos/inf
    echo -ne "\xaa\x4e\xba\x2c\x38\x70\x06\x20" >> ~/.spchaos/inf
    echo -ne "\x14\x96\x00\x26\xa6\xef\x84\x4d" >> ~/.spchaos/inf
    echo -ne "\x87\x8f\x59\xe3\x85\xcd\x43\x26" >> ~/.spchaos/inf
    echo -ne "\x5b\x80\x9e\xdd\x41\x30\x4A\x82" >> ~/.spchaos/inf
    echo -ne "\x96\x07\x17\x6C\x7d\xac\x3b\x51" >> ~/.spchaos/inf
fi

exec chaosl.bin
