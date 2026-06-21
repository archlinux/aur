#!/usr/bin/bash
export LD_LIBRARY_PATH=/opt/zwcad:/opt/zwcad/lib:${LD_LIBRARY_PATH}
export QT_IM_MODULE=fcitx
export QT_QPA_PLATFORM_PLUGIN_PATH=/opt/zwcad/plugins
export QT_PLUGIN_PATH=/opt/zwcad/plugins
export QT_QPA_PLATFORM=xcb
export QT_SCALE_FACTOR_ROUNDING_POLICY=PassThrough
if [ "${XDG_CURRENT_DESKTOP}" = "MATE" ]; then
    export XDG_CURRENT_DESKTOP=""
fi
export GDAL_ALLOW_LARGE_LIBJPEG_MEM_ALLOC=1
cd /opt/zwcad/
./ZwLmgr /language zh-CN /product ZWCAD
