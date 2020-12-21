#!/bin/bash
LD_PRELOAD=/usr/lib/gcc/x86_64-pc-linux-gnu/6.5.0/libgcj.so pdftk-bin "$@"
