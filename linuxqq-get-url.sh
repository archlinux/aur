#!/usr/bin/env bash
# linuxqq-get-url.sh - 动态获取 QQ Linux 的带签名下载链接
#
# QQ 的 deb 包下载需经过 im.qq.com 的 GetSign 服务换取带 sign 的临时链接，
# 否则 qqdl.gtimg.cn 上的原始 URL 会被拒绝。本脚本封装该流程：
#   1) 从 pcConfig.json 解析指定架构的原始 deb 链接
#   2) 请求 im.qq.com/index/ 抓取 tgw_l7_route cookie
#   3) 调用 GetSign 换取带 sign 的下载链接
#
# 用法:
#   linuxqq-get-url.sh <arch>                      输出指定架构的带签名 deb 链接
#   linuxqq-get-url.sh --dlagent <url> <output>    签名并下载到 <output>（DLAGENT 模式）
#
# 参数:
#   arch    目标架构，可选值: x86_64, aarch64, loong64
#   url     待签名的 deb 链接（仅 DLAGENT 模式）
#   output  下载文件保存路径（仅 DLAGENT 模式）
#
# 依赖: bash, curl, python3

set -euo pipefail

CONFIG_URL="https://qq-web.cdn-go.cn/im.qq.com_new/latest/rainbow/pcConfig.json"
COOKIE_URL="https://im.qq.com/index/"
SIGN_URL="https://im.qq.com/http2rpc/gotrpc/noauth/trpc.qqntv2.urlsign.UrlSign/GetSign"
USER_AGENT="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36"

# 从 im.qq.com/index/ 抓取 tgw_l7_route cookie
_fetch_route_cookie() {
    local cookie
    cookie=$(curl -fsSL -A "$USER_AGENT" -c - "$COOKIE_URL" 2>/dev/null \
        | awk '/tgw_l7_route/ {print $7; exit}')
    if [[ -z "$cookie" ]]; then
        echo "无法从 $COOKIE_URL 获取 tgw_l7_route cookie" >&2
        return 1
    fi
    printf '%s' "$cookie"
}

# 对指定 deb 链接换取带 sign 的临时链接
_sign_url() {
    local url="$1"
    local cookie signed_url

    cookie=$(_fetch_route_cookie)

    signed_url=$(curl -fsSL -A "$USER_AGENT" \
        -H "Content-Type: application/json" \
        -H "Origin: https://im.qq.com" \
        -H "Referer: https://im.qq.com/index/" \
        -H "x-oidb: {\"uint32_command\":\"0x9b8e\",\"uint32_service_type\":1}" \
        -b "tgw_l7_route=$cookie" \
        --data-binary "$(python3 -c "import json,sys; print(json.dumps({'url': sys.argv[1]}))" "$url")" \
        "$SIGN_URL" \
        | python3 -c "import json,sys; print(json.load(sys.stdin)['data']['url'])")

    if [[ -z "$signed_url" ]]; then
        echo "GetSign 返回结果中无 data.url" >&2
        return 1
    fi
    printf '%s\n' "$signed_url"
}

# 从 pcConfig.json 解析指定架构的原始 deb 链接
_resolve_deb_url() {
    local arch="$1"
    local key config deb_url

    case "$arch" in
        x86_64)  key="x64DownloadUrl" ;;
        aarch64) key="armDownloadUrl" ;;
        loong64) key="loongarchDownloadUrl" ;;
        *)
            echo "未知架构: $arch" >&2
            return 1
            ;;
    esac

    config=$(curl -fsSL -A "$USER_AGENT" "$CONFIG_URL")

    if [[ "$key" == "loongarchDownloadUrl" ]]; then
        deb_url=$(printf '%s' "$config" | python3 -c "
import json, sys
print(json.load(sys.stdin)['Linux']['loongarchDownloadUrl'])
")
    else
        deb_url=$(printf '%s' "$config" | python3 -c "
import json, sys
print(json.load(sys.stdin)['Linux']['$key']['deb'])
")
    fi

    if [[ -z "$deb_url" ]]; then
        echo "无法解析 $arch 的 deb 链接" >&2
        return 1
    fi
    printf '%s\n' "$deb_url"
}

# DLAGENT 模式：签名并下载到指定路径
if [[ "${1:-}" == "--dlagent" ]]; then
    url="$2"
    output="$3"

    signed_url=$(_sign_url "$url")
    curl -fsSL -A "$USER_AGENT" -o "$output" "$signed_url"
    exit 0
fi

# 独立调用模式：根据架构输出带签名链接
if [[ $# -lt 1 ]]; then
    echo "用法: $0 <arch>  或  $0 --dlagent <url> <output>" >&2
    exit 1
fi

arch="$1"
deb_url=$(_resolve_deb_url "$arch")
_sign_url "$deb_url"
