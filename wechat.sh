#!/bin/bash
bwrap --dev-bind / / \
    --bind /opt/apps/com.tencent.weixin/os-release /etc/os-release \
    --bind /opt/apps/com.tencent.weixin/lsb-release /etc/lsb-release \
    /opt/apps/com.tencent.weixin/files/weixin/weixin $@
