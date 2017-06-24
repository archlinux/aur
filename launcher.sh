#!/bin/sh

# Installation dir
LTT='/opt/ltt'

# Load libraries from installation dir first before looking in standard path
LD_LIBRARY_PATH="$LTT" "$LTT/hpe_ltt"
