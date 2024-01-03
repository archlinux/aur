#!/bin/bash

ENABLE_HDR_WSI=1 gamescope --fullscreen -w 2560 -h 1440 --hdr-enabled --hdr-debug-force-output --steam -- env ENABLE_GAMESCOPE_WSI=1 DXVK_HDR=1 DISABLE_HDR_WSI=1 steam -bigpicture
