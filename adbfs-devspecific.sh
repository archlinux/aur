#!/bin/bash

## This script is put in the public domain; 2024-03-27.

VERSION=0.2_20240327.01

## See https://github.com/spion/adbfs-rootless/issues/67#issuecomment-1913589823 for background

msg() {
  printf '%s\n' "$@"
}

errmsg() {
  msg "$@" > /dev/stderr
}

usage() {
  msg "Usage:"
  msg "  * $0 --help"
  msg "  * $0 --version"
  msg "  * $0 -D [Android Device ID] <adbfs-options>"
  msg ""
  msg "Where '[Android Device ID]' is a serial number as e.g. shown by 'adb devices'."
  msg ""
  msg "Runs 'adbfs' only for the specified android device."
}

if [ $# -eq 0 ]; then
  errmsg "$0: Arguments need to be specified."
  errmsg ""
  errmsg "`usage`"
  errmsg ""
  errmsg "Aborting."
  exit 1
fi

if [ "${1}x" == "--helpx" ]; then
  usage
  exit 0
fi

if [ "${1}x" == "--versionx" ]; then
  msg "${VERSION}"
  exit 0
fi

if [ "${1}x" != "-Dx" ]; then
  errmsg "$0: Error: First argument needs to be '-D' (or '--help')."
  errmsg ""
  errmsg "Run '$0 --help' for usage info."
  errmsg ""
  errmsg "Aborting."
  exit 2
fi

if [ -n "$2" ]; then
  _android_serial="$2"
  shift
  shift
else
  errmsg "$0: Error: Second argument needs to be an Android device ID."
  errmsg ""
  errmsg "Run '$0 --help' for usage info."
  errmsg ""
  errmsg "Aborting."
  exit 3
fi

ANDROID_SERIAL="${_android_serial}" adbfs "$@"
