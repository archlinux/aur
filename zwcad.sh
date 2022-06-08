#!/usr/bin/bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/zwcad/lib/mono/lib
export MONO_PATH=$MONO_PATH:/opt/zwcad/lib/mono/lib/mono/4.5
export QT_IM_MODULE=fcitx
export GDAL_ALLOW_LARGE_LIBJPEG_MEM_ALLOC=1

cd /opt/zwcad/
./ZWCAD "$@" /product ZWCAD
