#!/usr/bin/env bash

# TODO: Make it detect if x86 or arm, if is not x86 then fail

if [ `getconf LONG_BIT` = "64" ]
then
    "/usr/share/lostconstellation/Lost Constellation.x86_64"
else
    "/usr/share/lostconstellation/Lost Constellation.x86"
fi
