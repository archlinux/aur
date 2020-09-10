#!/bin/bash
PORT=/dev/ttyACM0
while true
do
 echo -n "~U" > $PORT
 sleep 1
done
