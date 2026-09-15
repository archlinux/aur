#!/bin/sh

LD_PRELOAD=/usr/lib64/libdrm.so.2:/usr/lib64/libdrm_amdgpu.so.1:/usr/lib64/libdrm_intel.so.1 /opt/appimages/freecad.AppImage "$@"
