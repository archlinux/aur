#!/bin/bash
PROFILES=/usr/share/chromium-mpp-profiles
DEC_DEFAULT="${PROFILES}/default.dec"
ENC_DEFAULT="${PROFILES}/default.enc"

if [[ "$1" ]];then
  DEC="${PROFILES}/$1.dec"
  if [[ ! -f "${DEC}" ]]; then
    echo "Warning: decoding profile for $1 does not exist, using default"
    DEC="${ENC_DEFAULT}"
  fi
  ENC="${PROFILES}/$1.enc"
  if [[ ! -f "${ENC}" ]]; then
    echo "Warning: encoding profile for $1 does not exist, using default"
    ENC="${ENC_DEFAULT}"
  fi
else
  echo "Warning: profile not set, using default"
  DEC="${DEC_DEFAULT}"
  ENC="${ENC_DEFAULT}"
fi
if [[ ! -f "${DEC}" ]]; then
  echo "Error: decoding profile '${DEC}' does not exist"
  exit 1
fi
if [[ ! -f "${ENC}" ]]; then
  echo "Error: encoding profile '${ENC}' does not exist"
  exit 1
fi
if ! install --owner=root --group=video --mode=0660 "${DEC}" /dev/video-dec0; then
  echo "Error: failed to install decoding dummy device"
  exit 1
fi
if ! install --owner=root --group=video --mode=0660 "${ENC}" /dev/video-enc0; then
  echo "Error: failed to install encoding dummy device"
  exit 1
fi