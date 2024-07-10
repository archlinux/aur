#!/bin/sh
wineserver -k
kill -9 $(ps -ef | grep -E -i '(wine|processid|\.exe)' | awk '{print $2}')
killall -9 pressure-vessel-adverb
