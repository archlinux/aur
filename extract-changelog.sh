#!/usr/bin/sh

# extract changelog
sed -En '/^Version History\r/,$p' src/PerformanceTest/readme.txt | tail --lines=+4 >CHANGELOG
