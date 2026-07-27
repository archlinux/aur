#!/bin/bash
unset QT_QPA_PLATFORMTHEME QT_STYLE_OVERRIDE QT_QUICK_CONTROLS_STYLE
export QT_QPA_PLATFORM=xcb
export QT_XCB_GL_INTEGRATION=none
export QT_IM_MODULE="${QT_IM_MODULE:-ibus}"
export QT_PLUGIN_PATH=/opt/mailmaster/plugins
export LD_LIBRARY_PATH="/opt/mailmaster/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
cd /opt/mailmaster && exec ./mailmaster "$@"
