#!/bin/bash

if (( EUID != 0 )); then
  echo "This script must be run as root, and is intended to be run by systemd during suspend/resume"
  echo "to use place this script in /usr/lib/systemd/system-sleep/ and make it executable"
  exit 1
fi

mkdir -p /root/amd-stb-captures

case "$1" in
  "pre")
    #echo "taking STB capture pre suspend at $(date)..." >/root/amd-stb-captures/capture.log
    cat /sys/kernel/debug/amd_pmc/stb_read >"/root/amd-stb-captures/$(/usr/bin/date +%s)-pre.stb"
    /usr/bin/sync /root/amd-stb-captures/*
    ;;
  "post")
    #echo "taking STB capture post suspend at $(date)..." >>/root/amd-stb-captures/capture.log
    cat /sys/kernel/debug/amd_pmc/stb_read >"/root/amd-stb-captures/$(/usr/bin/date +%s)-post.stb"
    /usr/bin/sync /root/amd-stb-captures/*
    ;;
esac

