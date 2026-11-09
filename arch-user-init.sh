#!/usr/bin/env bash
set -e

# ==========================================
# (0) 目标站点盘点（对照上游 6.1.2 postinst 多注册源治理）
# ==========================================
SITES=("$HOME/.local/share/Kingsoft/wps/jsaddons")
# 个别构建仅生成小写 kingsoft（大小写敏感），两处都写入以免漏读
SITES+=("$HOME/.local/share/kingsoft/wps/jsaddons")
# office6 用户级镜像（部分宿主会把 jsaddons 解析到这里）：
# 仅已存在才同步，不新造注册源
for _base in Kingsoft kingsoft; do
    _mirror="$HOME/.local/share/${_base}/office6/jsaddons"
    if [ -d "$_mirror" ]; then
        SITES+=("$_mirror")
    fi
done

clean_authaddin() {
    # 清理 chayuan 注册记录，保留其他插件状态。
    # 升级换版本目录后记录会指向旧版路径（幽灵 path），全删走重新信任流程，
    # namelist 中的哈希键串同步收缩。
    python3 - "$1" << 'EOF'
import json, os, sys

path = sys.argv[1]
if not os.path.isfile(path):
    sys.exit(0)
try:
    with open(path, 'r', encoding='utf-8') as f:
        data = json.load(f)

    modified = False
    if isinstance(data, dict):
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
}

strip_chayuan_from_root_xml() {
    # 清扫 office6 根 jsplugins.xml / publish.xml 中 wpsjs 调试期残留的
    # chayuan 注册（含幽灵 jspluginonline 条目）；顺带修复双 <jsplugins> 根。
    python3 - "$1" << 'EOF'
import os, sys

path = sys.argv[1]
if not os.path.isfile(path):
    sys.exit(0)
try:
    with open(path, 'r', encoding='utf-8') as f:
        lines = f.read().splitlines()

    kept = [ln for ln in lines
            if 'chayuan' not in ln
            and '<?xml' not in ln
            and '<jsplugins' not in ln
            and '</jsplugins' not in ln]

    out = ['<?xml version="1.0" encoding="UTF-8" standalone="yes"?>',
           '<jsplugins>']
    out.extend(kept)
    out.append('</jsplugins>')
    with open(path, 'w', encoding='utf-8') as f:
        f.write('\n'.join(out) + '\n')
except Exception:
    pass
EOF
}

# ==========================================
# (1) 各注册源：清理旧版残留、部署新版本、合并注册清单
# ==========================================
for DEST in "${SITES[@]}"; do
    mkdir -p "$DEST"

    # 清理察元的历史版本目录（不影响其他插件目录），并清掉中断安装留下的 staging 目录
    rm -rf "$DEST"/chayuan_* "$DEST"/chayuan-et_* "$DEST"/chayuan-wpp_* \
           "$DEST"/.chayuan*.installing

    clean_authaddin "$DEST/authaddin.json"

    # 创建指向新版本 /opt 的软链接
    for comp in chayuan chayuan-et chayuan-wpp; do
        ln -sf "/opt/chayuan-wps-addon/${comp}_@PKGVER@" "$DEST/${comp}_@PKGVER@"
    done

    # ==========================================
    # (2) 安全合并配置（排除法过滤，自带双根保护）
    # ==========================================
    if [ -f "$DEST/publish.xml" ]; then
        OTHERS=$(grep -i "jsplugin" "$DEST/publish.xml" \
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
    } > "$DEST/publish.xml"

    # WPS(Linux) 实际按 jsplugins.xml 加载本地插件，publish.xml 只是 wpsjs 在线安装清单
    cp -f "$DEST/publish.xml" "$DEST/jsplugins.xml"
done

# ==========================================
# (3) office6 根目录的调试残留注册清扫
# ==========================================
for _base in Kingsoft kingsoft; do
    for _f in jsplugins.xml publish.xml; do
        _root="$HOME/.local/share/${_base}/office6/${_f}"
        if [ -f "$_root" ]; then
            strip_chayuan_from_root_xml "$_root"
        fi
    done
done

# ==========================================
# (4) 部署后端服务
# ==========================================
MCP_HOME="$HOME/.config/chayuan-wps/mcp"
mkdir -p "$MCP_HOME/runtime"

cp -r /opt/chayuan-wps-addon/chayuan_@PKGVER@/mcp-sidecar/* "$MCP_HOME/runtime/" 2>/dev/null || true
rm -rf "$MCP_HOME/runtime/bin"
ln -sf "/opt/chayuan-wps-addon/chayuan_@PKGVER@/mcp-sidecar/bin" "$MCP_HOME/runtime/bin"
