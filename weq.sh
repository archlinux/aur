#!/bin/sh
# WeQ 的启动入口。真正的二进制是 /opt/weq/@weqdesktop。
#
# 只做一件事：导出包管理器托管标记，让应用把「应用内下载安装」换成
# `paru -Syu` 的提示。参数一律透传（`--ozone-platform` 之类由应用自己处理）。
export WEQ_PACKAGE_MANAGED=1
exec /opt/weq/@weqdesktop "$@"
