#!/bin/sh
cd "/usr/share/serioussam/SamTSE/Bin"
export LD_LIBRARY_PATH=".:${LD_LIBRARY_PATH}"
./SeriousSam
