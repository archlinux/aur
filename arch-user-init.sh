#!/usr/bin/env bash
set -e

USER_JS_DIR="$HOME/.local/share/Kingsoft/wps/jsaddons"
mkdir -p "$USER_JS_DIR"

# (1) 部署前端文件
rm -rf "$USER_JS_DIR/chayuan_@PKGVER@"
ln -sf "/opt/chayuan-wps-addon/chayuan_@PKGVER@" "$USER_JS_DIR/chayuan_@PKGVER@"

# (2) 注入原生离线插件配置（精确过滤，防套娃）
if [ -f "$USER_JS_DIR/publish.xml" ]; then
    # 【彻底修复】：使用正则表达式，要求匹配后必须跟空格或右尖括号，屏蔽 <jsplugins>
    OTHERS=$(grep -E -i "<jsplugin(online)?[ >]" "$USER_JS_DIR/publish.xml" | grep -vi "chayuan" || true)
else
    OTHERS=""
fi

{
    echo '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
    echo '<jsplugins>'
    [ -n "$OTHERS" ] && echo "$OTHERS"
    echo '    <jsplugin name="chayuan" type="wps" url="chayuan_@PKGVER@" version="@PKGVER@" enable="enable" install="null" customDomain=""/>'
    echo '</jsplugins>'
} > "$USER_JS_DIR/publish.xml"

# (3) 部署后端服务
MCP_HOME="$HOME/.config/chayuan-wps/mcp"
mkdir -p "$MCP_HOME/runtime"
cp -r /opt/chayuan-wps-addon/chayuan_@PKGVER@/mcp-sidecar/* "$MCP_HOME/runtime/" 2>/dev/null || true
rm -rf "$MCP_HOME/runtime/bin"
ln -sf "/opt/chayuan-wps-addon/chayuan_@PKGVER@/mcp-sidecar/bin" "$MCP_HOME/runtime/bin"
