#!/usr/bin/env bash
set -e

USER_JS_DIR="$HOME/.local/share/Kingsoft/wps/jsaddons"
mkdir -p "$USER_JS_DIR"

# ==========================================
# (1) 清理旧版残留与精准剥离 JSON 缓存，部署新前端
# ==========================================
# 清理察元的历史版本软链接（不影响其他插件目录）
rm -rf "$USER_JS_DIR"/chayuan_* "$USER_JS_DIR"/chayuan-et_* "$USER_JS_DIR"/chayuan-wpp_*

# 使用 Python 精准清理 authaddin.json 中的 chayuan 记录，保留其他插件状态
if [ -f "$USER_JS_DIR/authaddin.json" ]; then
    python3 - "$USER_JS_DIR/authaddin.json" << 'EOF'
import json, sys

path = sys.argv[1]
try:
    with open(path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    modified = False
    for host in ['wps', 'et', 'wpp', 'pdf']:
        if host in data and isinstance(data[host], dict):
            to_delete = []
            for k, v in data[host].items():
                if isinstance(v, dict) and str(v.get('name', '')).startswith('chayuan'):
                    to_delete.append(k)
            
            if to_delete:
                modified = True
                for k in to_delete:
                    del data[host][k]
                
                # 同步清理 namelist 中的哈希值
                if 'namelist' in data[host] and isinstance(data[host]['namelist'], str):
                    names = [x for x in data[host]['namelist'].split(';') if x and x not in to_delete]
                    data[host]['namelist'] = ';'.join(names)

    if modified:
        with open(path, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=4, ensure_ascii=False)
except Exception:
    pass
EOF
fi

# 创建指向新版本 /opt 的软链接
for comp in chayuan chayuan-et chayuan-wpp; do
    ln -sf "/opt/chayuan-wps-addon/${comp}_@PKGVER@" "$USER_JS_DIR/${comp}_@PKGVER@"
done

# ==========================================
# (2) 安全合并配置（排除法过滤）
# ==========================================
if [ -f "$USER_JS_DIR/publish.xml" ]; then
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
    echo '    <jsplugin name="chayuan-et" type="et" url="chayuan-et_@PKGVER@" version="@PKGVER@" enable="enable" install="null" customDomain=""/>'
    echo '    <jsplugin name="chayuan-wpp" type="wpp" url="chayuan-wpp_@PKGVER@" version="@PKGVER@" enable="enable" install="null" customDomain=""/>'
    echo '</jsplugins>'
} > "$USER_JS_DIR/publish.xml"

# 同步 jsplugins.xml 适配 6.1.0 官方逻辑
cp -f "$USER_JS_DIR/publish.xml" "$USER_JS_DIR/jsplugins.xml"

# ==========================================
# (3) 部署后端服务
# ==========================================
MCP_HOME="$HOME/.config/chayuan-wps/mcp"
mkdir -p "$MCP_HOME/runtime"

cp -r /opt/chayuan-wps-addon/chayuan_@PKGVER@/mcp-sidecar/* "$MCP_HOME/runtime/" 2>/dev/null || true
rm -rf "$MCP_HOME/runtime/bin"
ln -sf "/opt/chayuan-wps-addon/chayuan_@PKGVER@/mcp-sidecar/bin" "$MCP_HOME/runtime/bin"
