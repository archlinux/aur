#!/bin/bash
cd /opt/broforce
while getopts ":lmh" opt; do
  case ${opt} in
    l ) ./Broforce.x86
      ;;
    m ) ./Broforce.x86_64
      ;;
    h ) echo "Usage: broforce [-l: legacy 32-bit Broforce.x86|-m: modern 64-bit Broforce.x86_64 (default)]"
      ;;
  esac
  exit
done
./Broforce.x86_64
