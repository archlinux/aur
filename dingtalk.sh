#!/bin/bash -e
# try wayland and fallback to xcb in case that it may support xcb some day.
export QT_QPA_PLATFORM="wayland;xcb"
cd /opt/dingtalk/release
./com.alibabainc.dingtalk
