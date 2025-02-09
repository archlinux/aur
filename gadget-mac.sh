#!/bin/bash
mac=$((cat /etc/machine-id; echo "$@"; ) | sha256sum -)
echo "22:${mac:0:2}:${mac:4:2}:${mac:8:2}:${mac:12:2}:${mac:16:2}"
