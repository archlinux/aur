#!/bin/bash

# QQ音乐 Wine 启动脚本

# wine-staging 环境变量
export STAGING_SHARED_MEMORY=1
export STAGING_RT_PRIORITY_SERVER=1

# DXVK 配置（针对音乐软件优化）
export DXVK_LOG_LEVEL=warn
export DXVK_HUD=fps,memory

# 用户配置目录
USER_CONFIG_DIR="$HOME/.config/qqmusic-wine"

# 初始化用户配置
if [ ! -d "$USER_CONFIG_DIR" ]; then
    echo "正在初始化 QQ音乐 用户配置..."
    mkdir -p "$USER_CONFIG_DIR"
    cp -r "/opt/qqmusic-wine/wineprefix" "$USER_CONFIG_DIR/"
    
    export WINEPREFIX="$USER_CONFIG_DIR/wineprefix"
    
    echo "用户配置初始化完成！"
fi

export WINEPREFIX="$USER_CONFIG_DIR/wineprefix"

# 查找 QQ音乐 可执行文件
QQMUSIC_PATH=""
if [ -f "$WINEPREFIX/drive_c/Program Files/Tencent/QQMusic/QQMusic.exe" ]; then
    QQMUSIC_PATH="$WINEPREFIX/drive_c/Program Files/Tencent/QQMusic"
elif [ -f "$WINEPREFIX/drive_c/Program Files (x86)/Tencent/QQMusic/QQMusic.exe" ]; then
    QQMUSIC_PATH="$WINEPREFIX/drive_c/Program Files (x86)/Tencent/QQMusic"
else
    echo "错误：找不到 QQ音乐 安装目录"
    echo "请检查安装是否成功"
    exit 1
fi

echo "正在启动 QQ音乐..."

# 切换到程序目录并启动
cd "$QQMUSIC_PATH"
wine "QQMusic.exe" "$@"
