#! /bin/sh

################################################################
## This has to be done because a shutdown will otherwise fail ##
################################################################

## nouveau or radeon are unloaded by tlp when the device is on battery
modprobe nouveau
modprobe radeon

echo ON > /sys/kernel/debug/vgaswitcheroo/switch
