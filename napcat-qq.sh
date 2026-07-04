#!/bin/bash

PLUGIN_DIR="$HOME/.config/napcat-qq-plugin"
DATA_DIR="$HOME/.config/napcat-qq-plugin"

mkdir -p "$DATA_DIR"

if command -v rsync >/dev/null 2>&1; then
    rsync -a --update --exclude='config/' /opt/napcat-qq/resources/app/app_launcher/napcat-base/ "$PLUGIN_DIR/"
else
    cp -u -n -r /opt/napcat-qq/resources/app/app_launcher/napcat-base/* "$PLUGIN_DIR/"
fi

QQ_VERSION_CONFIG="$HOME/.config/QQ/versions/config.json"
NAPCAT_VERSION="3.2.29-49738"
BUILD_ID="49738"
BACKUP="${QQ_VERSION_CONFIG}.napcat.bak"

[ -f "$BACKUP" ] && mv "$BACKUP" "$QQ_VERSION_CONFIG"

if [ -f "$QQ_VERSION_CONFIG" ]; then
    cp "$QQ_VERSION_CONFIG" "$BACKUP"
    mkdir -p "$(dirname "$QQ_VERSION_CONFIG")"
    cat > "$QQ_VERSION_CONFIG" << EOF
{
    "baseVersion": "$NAPCAT_VERSION",
    "curVersion": "$NAPCAT_VERSION",
    "buildId": "$BUILD_ID"
}
EOF
    trap "mv '$BACKUP' '$QQ_VERSION_CONFIG'" EXIT
fi

# 添加 env LD_PRELOAD 环境变量，将动态库注入 QQ 进程
xvfb-run -a env LD_PRELOAD="/opt/napcat-qq/libnapcat_launcher.so" /opt/napcat-qq/qq --no-sandbox --user-data-dir="$DATA_DIR" "$@"
