#!/bin/bash
URI_TO_OPEN="$1"

# snapd-xdg-open 和 flatpak-xdg-open 在此处都有使用
# 一个是为了打开链接，一个是为了使用本地图片查看器打开本地图片
# 请不要因为你认为依赖重复就把软件包标记为过期

if ! [ "${URI_TO_OPEN:0:8}" == "jsbridge" ]; then
    if [ "${URI_TO_OPEN:0:4}" == "http" ]; then
        /snapd-xdg-open "$URI_TO_OPEN"
    else
        /flatpak-xdg-open "$URI_TO_OPEN"
    fi
fi
