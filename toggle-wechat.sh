#!/bin/bash

CACHE_DIR="$HOME/.cache/toggle-wechat"
SCRIPT_FILE="$CACHE_DIR/toggle.js"
TRAY_CACHE="$CACHE_DIR/tray_svc"

mkdir -p "$CACHE_DIR"

# 获取微信托盘服务（带缓存）
get_wechat_tray() {
    # 检查缓存是否有效
    if [ -f "$TRAY_CACHE" ]; then
        local cached_svc=$(cat "$TRAY_CACHE")
        # 验证缓存的服务是否仍然有效
        local id=$(qdbus6 $cached_svc /StatusNotifierItem org.freedesktop.DBus.Properties.Get org.kde.StatusNotifierItem Id 2>/dev/null)
        if [ "$id" = "wechat" ]; then
            echo "$cached_svc"
            return 0
        fi
    fi
    
    # 重新查找
    for svc in $(qdbus6 org.kde.StatusNotifierWatcher /StatusNotifierWatcher org.freedesktop.DBus.Properties.Get org.kde.StatusNotifierWatcher RegisteredStatusNotifierItems 2>/dev/null | tr -d '[]," '); do
        local svc_name=$(echo $svc | sed 's|/StatusNotifierItem||')
        local id=$(qdbus6 $svc_name /StatusNotifierItem org.freedesktop.DBus.Properties.Get org.kde.StatusNotifierItem Id 2>/dev/null)
        if [ "$id" = "wechat" ]; then
            echo "$svc_name" > "$TRAY_CACHE"
            echo "$svc_name"
            return 0
        fi
    done
    return 1
}

WECHAT_SVC=$(get_wechat_tray)
if [ -z "$WECHAT_SVC" ]; then
    echo "微信托盘未找到"
    exit 1
fi

# 检查脚本文件是否需要更新（托盘服务名变化时）
NEED_UPDATE=0
if [ ! -f "$SCRIPT_FILE" ]; then
    NEED_UPDATE=1
elif ! grep -q "$WECHAT_SVC" "$SCRIPT_FILE" 2>/dev/null; then
    NEED_UPDATE=1
fi

if [ "$NEED_UPDATE" = "1" ]; then
    cat > "$SCRIPT_FILE" << KWINSCRIPT
var clients = workspace.windowList();
var wechatWindow = null;

for (var i = 0; i < clients.length; i++) {
    var c = clients[i];
    if (c.resourceClass && c.resourceClass.toLowerCase() === "wechat") {
        wechatWindow = c;
        break;
    }
}

if (wechatWindow) {
    var isActive = (workspace.activeWindow === wechatWindow);
    if (wechatWindow.minimized || !isActive) {
        wechatWindow.minimized = false;
        workspace.activeWindow = wechatWindow;
    } else {
        wechatWindow.closeWindow();
    }
} else {
    callDBus("$WECHAT_SVC", "/StatusNotifierItem", "org.kde.StatusNotifierItem", "Activate", 0, 0);
}
KWINSCRIPT
fi

# 加载并运行脚本
SCRIPT_ID=$(qdbus6 org.kde.KWin /Scripting org.kde.kwin.Scripting.loadScript "$SCRIPT_FILE" 2>/dev/null)
if [ -n "$SCRIPT_ID" ] && [ "$SCRIPT_ID" -gt 0 ] 2>/dev/null; then
    qdbus6 org.kde.KWin /Scripting/Script${SCRIPT_ID} org.kde.kwin.Script.run 2>/dev/null
fi
