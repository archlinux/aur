#!/usr/bin/bash
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/qt/plugins
export selfpath=/opt/foxitpdfeditor
export LD_LIBRARY_PATH=$selfpath/rmssdk:$selfpath/fxplugins:$LD_LIBRARY_PATH
cd $selfpath
./"Foxit PDF Editor" "$@" 
