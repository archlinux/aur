#!/bin/bash

PLUGIN_DIR="$HOME/.config/napcat-qq-plugin"
DATA_DIR="$HOME/.config/napcat-qq-data"

mkdir -p "$PLUGIN_DIR"
mkdir -p "$DATA_DIR"

cp -u -r /opt/napcat-qq/resources/app/app_launcher/napcat-base/* "$PLUGIN_DIR/"

export ELECTRON_USER_DATA_DIR="$DATA_DIR"

# ---------- 版本欺骗 ----------
QQ_VERSION_CONFIG="$HOME/.config/QQ/versions/config.json"
NAPCAT_VERSION="3.2.23-44343"
BACKUP_FILE="${QQ_VERSION_CONFIG}.napcat.bak"
# 如果备份存在，直接恢复
if [ -f "$BACKUP_FILE" ]; then
    mv "$BACKUP_FILE" "$QQ_VERSION_CONFIG"
fi

# 如果系统存在普通 QQ 的版本文件，则临时替换
if [ -f "$QQ_VERSION_CONFIG" ]; then
    # 备份原文件
    cp "$QQ_VERSION_CONFIG" "$BACKUP_FILE"
    # 创建符合 NapCat 版本的文件
    mkdir -p "$(dirname "$QQ_VERSION_CONFIG")"
    cat > "$QQ_VERSION_CONFIG" << EOF
{
    "baseVersion": "$NAPCAT_VERSION",
    "curVersion": "$NAPCAT_VERSION",
    "buildId": "44343"
}
EOF
    RESTORE_NEEDED=true
else
    RESTORE_NEEDED=false
fi

# 无论退出方式如何，都尝试恢复原版本文件
cleanup() {
    if [ "$RESTORE_NEEDED" = true ] && [ -f "$BACKUP_FILE" ]; then
        mv "$BACKUP_FILE" "$QQ_VERSION_CONFIG"
    fi
}
trap cleanup EXIT

xvfb-run -a /opt/napcat-qq/qq --no-sandbox --user-data-dir="$DATA_DIR" "$@"
