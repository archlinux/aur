#!/usr/bin/env bash
set -e

USER_JS_DIR="$HOME/.local/share/Kingsoft/wps/jsaddons"
mkdir -p "$USER_JS_DIR"

# ==========================================
# (1) 部署前端文件（软链接）
# ==========================================
rm -rf "$USER_JS_DIR/chayuan_@PKGVER@"
ln -sf "/opt/chayuan-wps-addon/chayuan_@PKGVER@" "$USER_JS_DIR/chayuan_@PKGVER@"

# ==========================================
# (2) 安全合并配置（排除法过滤，杜绝嵌套）
# ==========================================
if [ -f "$USER_JS_DIR/publish.xml" ]; then
    # 提取所有包含 jsplugin 的行，并逐层排除：xml声明、根节点头、根节点尾、察元旧配置
    OTHERS=$(grep -i "jsplugin" "$USER_JS_DIR/publish.xml" \
        | grep -vi "xml version" \
        | grep -vi "<jsplugins>" \
        | grep -vi "</jsplugins>" \
        | grep -vi "chayuan" || true)
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

# ==========================================
# (3) 部署后端服务
# ==========================================
MCP_HOME="$HOME/.config/chayuan-wps/mcp"
mkdir -p "$MCP_HOME/runtime"

cp -r /opt/chayuan-wps-addon/chayuan_@PKGVER@/mcp-sidecar/* "$MCP_HOME/runtime/" 2>/dev/null || true
rm -rf "$MCP_HOME/runtime/bin"
ln -sf "/opt/chayuan-wps-addon/chayuan_@PKGVER@/mcp-sidecar/bin" "$MCP_HOME/runtime/bin"
