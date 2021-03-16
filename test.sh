#!/bin/bash

# test.sh:
# Simple test: Assumes LEDs on Pins 0-7 and lights them in-turn.

mode=$1

for i in `seq 0 7`;
do
  gpio mode $i out
done

while true;
do
  for i in `seq 0 7`;
  do
    echo "gpio write $i 1"
    gpio write $i 1
    if [ -z "$mode" ]; then
       sleep 0.9;
    elif [[ "$mode"=="read" ]]; then
       read;
    fi
  done

  for i in `seq 0 7`;
  do
    echo "gpio write $i 0"
    gpio write $i 0
    if [ -z "$mode" ]; then
       sleep 0.9;
    elif [[ "$mode"=="read" ]]; then
       read;
    fi
  done
done
