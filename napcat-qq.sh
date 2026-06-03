#!/bin/bash

PLUGIN_DIR="$HOME/.config/napcat-qq-plugin"
DATA_DIR="$HOME/.config/napcat-qq-plugin"

mkdir -p "$DATA_DIR"
cp -u -r /opt/napcat-qq/resources/app/app_launcher/napcat-base/* "$PLUGIN_DIR/"

QQ_VERSION_CONFIG="$HOME/.config/QQ/versions/config.json"
NAPCAT_VERSION="3.2.23-44343"
BACKUP="${QQ_VERSION_CONFIG}.napcat.bak"

[ -f "$BACKUP" ] && mv "$BACKUP" "$QQ_VERSION_CONFIG"

# 如果存在官方QQ的版本文件，则备份并替换
if [ -f "$QQ_VERSION_CONFIG" ]; then
    cp "$QQ_VERSION_CONFIG" "$BACKUP"
    mkdir -p "$(dirname "$QQ_VERSION_CONFIG")"
    cat > "$QQ_VERSION_CONFIG" << EOF
{
    "baseVersion": "$NAPCAT_VERSION",
    "curVersion": "$NAPCAT_VERSION",
    "buildId": "44343"
}
EOF
    trap "mv '$BACKUP' '$QQ_VERSION_CONFIG'" EXIT
fi

xvfb-run -a /opt/napcat-qq/qq --no-sandbox --user-data-dir="$DATA_DIR" "$@"
