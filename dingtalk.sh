#!/bin/bash -e
# try wayland and fallback to xcb in case that it may support xcb some day.
export QT_QPA_PLATFORM="wayland;xcb"
export QT_AUTO_SCREEN_SCALE_FACTOR=1
cd /opt/dingtalk/release
./com.alibabainc.dingtalk
