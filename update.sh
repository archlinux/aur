#!/usr/bin/env bash
#####################################################################################
# Mimic-Node AUR Update Script
# 自动完成 AUR 包的本地构建和推送
#####################################################################################

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

info() { echo -e "${GREEN}[INFO]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1" >&2; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }

cd "$(dirname "$0")"

# 检查是否在 AUR 仓库目录
if [[ ! -d ".git" ]]; then
    error "请在 AUR 仓库目录中执行此脚本"
    exit 1
fi

info "Mimic-Node AUR 更新脚本"
echo ""

# 1. 拉取最新代码
info "拉取最新 PKGBUILD..."
git pull --rebase origin master || true

# 2. 清理旧构建
info "清理旧构建..."
rm -rf src/ pkg/ *.pkg.tar.zst 2>/dev/null || true

# 3. pkgrel 递增（强制触发用户更新检测）
current_pkgrel=$(grep '^pkgrel=' PKGBUILD | cut -d= -f2)
new_pkgrel=$((current_pkgrel + 1))
sed -i "s/^pkgrel=.*/pkgrel=$new_pkgrel/" PKGBUILD
info "pkgrel: $current_pkgrel → $new_pkgrel"

# 4. 构建并安装
info "构建并安装..."
makepkg -si --noconfirm

# 5. 提交更改
info "提交更改..."
git add -A
git commit -m "chore(aur): bump pkgrel to $new_pkgrel" || true

# 6. 推送到 AUR
info "推送到 AUR..."
git push origin master

info "AUR 更新完成!"

echo ""
echo "=============================================="
info "后续步骤:"
echo "  1. 用户端运行: paru -Syu --noconfirm mimic-node-git"
echo "  2. 或者触发远程更新 (如果配置了 CI/CD)"
echo "=============================================="
