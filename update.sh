#!/usr/bin/env bash
#
# onemessage-bin AUR 自动更新脚本
#
# 流程:
#   1. 下载上游 OneMessage2.0.deb, 从 deb 的 control 信息中读取版本号
#   2. 与 PKGBUILD 中的 pkgver 比较, 有新版本时更新 pkgver / pkgrel / sha256sums
#   3. 重新生成 .SRCINFO
#   4. 提交更改并推送到 AUR (默认), 可用 --no-push 仅本地提交
#
# 用法: ./update.sh [--no-push] [--check] [--build] [--help]

set -euo pipefail

DEB_URL="https://office.hecmcc.com:9003/cmict/file/resource/download/onemsgdownload/OneMessage2.0.deb"
# 上游服务器会对 curl 默认 UA 返回 404, 这里必须使用浏览器 UA
USER_AGENT="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36"

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
cd "$SCRIPT_DIR"

# 并发锁: 锁定脚本自身, 防止定时任务重叠执行
exec 9<"${BASH_SOURCE[0]}"
flock -n 9 || { echo "错误: 已有另一个更新进程正在运行" >&2; exit 1; }

PUSH=1
CHECK_ONLY=0
BUILD=0

log() { printf '==> %s\n' "$*"; }
warn() { printf '警告: %s\n' "$*" >&2; }
die() { printf '错误: %s\n' "$*" >&2; exit 1; }

usage() {
    cat <<EOF
用法: $(basename "$0") [选项]

选项:
  -n, --no-push 只本地提交, 不推送到 AUR
  -c, --check   只检查是否有新版本, 不修改任何文件
  -b, --build   更新后运行 makepkg 构建验证 (构建产物会被清理)
  -h, --help    显示本帮助

示例:
  $(basename "$0")              # 检查、更新、提交并推送到 AUR (默认)
  $(basename "$0") --no-push    # 只更新并在本地提交
  $(basename "$0") --check      # 只检查新版本

定时任务示例 (每天 9:00 自动更新并推送):
  0 9 * * * cd $SCRIPT_DIR && ./update.sh >> update.log 2>&1
EOF
}

while (($#)); do
    case "$1" in
        -p | --push) PUSH=1 ;;
        -n | --no-push) PUSH=0 ;;
        -c | --check) CHECK_ONLY=1 ;;
        -b | --build) BUILD=1 ;;
        -h | --help)
            usage
            exit 0
            ;;
        *)
            echo "未知参数: $1" >&2
            usage >&2
            exit 1
            ;;
    esac
    shift
done

for cmd in curl ar tar awk sed sha256sum makepkg vercmp git flock; do
    command -v "$cmd" >/dev/null 2>&1 || die "缺少命令: $cmd"
done

git rev-parse --is-inside-work-tree >/dev/null 2>&1 || die "当前目录不是 git 仓库"
[[ -f PKGBUILD ]] || die "未找到 PKGBUILD"
[[ -z "$(git status --porcelain -- PKGBUILD .SRCINFO)" ]] ||
    die "PKGBUILD 或 .SRCINFO 存在未提交的改动, 请先处理后再运行"

# 读取本地 PKGBUILD 中的版本、发布号与校验和
read -r LOCAL_VER LOCAL_REL LOCAL_SUM < <(
    set +u
    # shellcheck disable=SC1091
    source ./PKGBUILD
    printf '%s %s %s\n' "$pkgver" "$pkgrel" "${sha256sums[0]}"
)
[[ -n "$LOCAL_VER" && -n "$LOCAL_REL" && -n "$LOCAL_SUM" ]] || die "无法从 PKGBUILD 读取版本信息"

TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

DEB_FILE="$TMP_DIR/OneMessage2.0.deb"

log "下载上游安装包 ..."
curl -fSL --retry 3 --retry-delay 2 --connect-timeout 30 \
    -A "$USER_AGENT" -o "$DEB_FILE" "$DEB_URL" ||
    die "下载失败: $DEB_URL"

CONTROL_MEMBER=$(ar t "$DEB_FILE" | grep -m1 '^control\.tar\.' || true)
[[ -n "$CONTROL_MEMBER" ]] || die "deb 中未找到 control.tar.*"

case "$CONTROL_MEMBER" in
    *.gz) REMOTE_VER=$(ar p "$DEB_FILE" "$CONTROL_MEMBER" | tar -xzO ./control) ;;
    *.xz) REMOTE_VER=$(ar p "$DEB_FILE" "$CONTROL_MEMBER" | tar -xJO ./control) ;;
    *.zst) REMOTE_VER=$(ar p "$DEB_FILE" "$CONTROL_MEMBER" | tar --zstd -xO ./control) ;;
    *) die "不支持的 control 压缩格式: $CONTROL_MEMBER" ;;
esac

REMOTE_VER=$(printf '%s\n' "$REMOTE_VER" |
    awk -F': *' '/^Version:/ { v = $2 } END { print v }' | tr -d '\r')
[[ -n "$REMOTE_VER" ]] || die "无法从 deb 中读取版本号"

# Debian 版本号转换为 Arch pkgver: 去掉 epoch 和 Debian revision
REMOTE_VER=${REMOTE_VER#*:}
REMOTE_VER=${REMOTE_VER%-*}

REMOTE_SUM=$(sha256sum "$DEB_FILE" | awk '{ print $1 }')

log "本地版本: $LOCAL_VER-$LOCAL_REL"
log "上游版本: $REMOTE_VER"

VERSION_CMP=$(vercmp "$REMOTE_VER" "$LOCAL_VER")

if ((CHECK_ONLY)); then
    if [[ "$VERSION_CMP" == "1" ]]; then
        log "发现新版本: $REMOTE_VER"
    elif [[ "$REMOTE_SUM" != "$LOCAL_SUM" ]]; then
        log "版本号未变, 但上游安装包内容已变化 (重新打包)"
    else
        log "已是最新版本"
    fi
    exit 0
fi

NEW_VER=$LOCAL_VER
NEW_REL=$LOCAL_REL

if [[ "$VERSION_CMP" == "1" ]]; then
    NEW_VER=$REMOTE_VER
    NEW_REL=1
elif [[ "$VERSION_CMP" == "0" ]]; then
    if [[ "$REMOTE_SUM" == "$LOCAL_SUM" ]]; then
        log "已是最新版本 ($LOCAL_VER-$LOCAL_REL), 无需更新"
        exit 0
    fi
    NEW_REL=$((LOCAL_REL + 1))
    log "上游安装包已重新打包, pkgrel 递增到 $NEW_REL"
else
    die "上游版本 $REMOTE_VER 低于本地 $LOCAL_VER, 拒绝降级"
fi

log "更新 PKGBUILD: $LOCAL_VER-$LOCAL_REL -> $NEW_VER-$NEW_REL"
sed -i "s/^pkgver=.*/pkgver=$NEW_VER/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=$NEW_REL/" PKGBUILD
sed -i "s/^sha256sums=.*/sha256sums=('$REMOTE_SUM')/" PKGBUILD

grep -q "^pkgver=$NEW_VER$" PKGBUILD || die "pkgver 更新失败"
grep -q "^pkgrel=$NEW_REL$" PKGBUILD || die "pkgrel 更新失败"
grep -q "^sha256sums=('$REMOTE_SUM')$" PKGBUILD || die "sha256sums 更新失败"

log "重新生成 .SRCINFO ..."
makepkg --printsrcinfo >"$TMP_DIR/.SRCINFO"
mv "$TMP_DIR/.SRCINFO" .SRCINFO
grep -q "pkgver = $NEW_VER" .SRCINFO || die ".SRCINFO 更新失败"

if ((BUILD)); then
    log "构建验证 (makepkg -fc) ..."
    if ! makepkg -fc --noconfirm; then
        warn "构建验证失败, 还原 PKGBUILD 与 .SRCINFO"
        git checkout -- PKGBUILD .SRCINFO
        rm -rf src pkg
        die "构建失败, 已放弃本次更新"
    fi
fi

git add PKGBUILD .SRCINFO
git commit -m "chore: 更新到 $NEW_VER-$NEW_REL"

if ((PUSH)); then
    log "推送到 AUR ..."
    git push origin HEAD
    log "完成: 已更新并推送 $NEW_VER-$NEW_REL"
else
    log "完成: 已在本地提交 $NEW_VER-$NEW_REL (未推送, 可稍后手动 git push)"
fi
