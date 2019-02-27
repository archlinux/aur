#!/bin/bash
QT_QPA_PLATFORM=xcb \
LD_PRELOAD=/usr/lib/libfreetype.so.6 \
LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/soulseekqt \
/opt/soulseekqt/soulseekqt.AppImage
