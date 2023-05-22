#!/bin/sh
cd "/usr/share/serioussam/SamTFE/Bin"
export LD_LIBRARY_PATH=".:${LD_LIBRARY_PATH}"
./SeriousSam $1 $2
