#!/bin/sh

# Workaround for yaml parsing problem (old version of yaml-cpp)
sed 's:"\\x0a"::g' -i ~/.asciiportal/default.yaml

# Start ASCIIpOrtal from /usr/share/asciiportal
cd /usr/share/asciiportal
/usr/bin/asciiportal.elf $*

