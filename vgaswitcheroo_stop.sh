#! /bin/sh

################################################################
## This has to be done because a shutdown will otherwise fail ##
################################################################

echo ON > /sys/kernel/debug/vgaswitcheroo/switch
