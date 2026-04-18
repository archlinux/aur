#!/usr/bin/env bash
#####################################################################################
# Mimic-Node AUR Update Script
# 自动完成 AUR 包的本地构建和推送
#####################################################################################

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

info() { echo -e "${GREEN}[INFO]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1" >&2; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
step() { echo -e "${BLUE}[STEP]${NC} $1"; }

cd "$(dirname "$0")"

# 检查是否在 AUR 仓库目录
if [[ ! -d ".git" ]]; then
    error "请在 AUR 仓库目录中执行此脚本"
    exit 1
fi

echo ""
echo "================================================================================"
echo "                    Mimic-Node AUR 更新脚本"
echo "================================================================================"
echo ""

# 1. 拉取最新代码
step "拉取最新 PKGBUILD..."
git pull --rebase origin master 2>/dev/null || warn "无法拉取远程更新 (可能无网络或无更改)"

# 2. 清理旧构建
step "清理旧构建..."
rm -rf src/ pkg/ *.pkg.tar.zst 2>/dev/null || true

# 3. pkgrel 递增（强制触发用户更新检测）
current_pkgrel=$(grep '^pkgrel=' PKGBUILD | cut -d= -f2)
new_pkgrel=$((current_pkgrel + 1))
sed -i "s/^pkgrel=.*/pkgrel=$new_pkgrel/" PKGBUILD
info "pkgrel: $current_pkgrel → $new_pkgrel"

# 4. 同步 .SRCINFO，避免 AUR 前端和 AUR helper 读到过期元数据
step "更新 .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

# 5. 构建并安装
step "构建并安装..."
makepkg -si --noconfirm

# 6. 提交更改
step "提交更改..."
git add -A
git commit -m "chore(aur): bump pkgrel to $new_pkgrel" 2>/dev/null || info "无需提交 (无更改或已提交)"

# 7. 推送到 AUR
step "推送到 AUR..."
git push origin master 2>/dev/null || warn "无法推送 (可能无网络或无更改)"

echo ""
echo "================================================================================"
echo "                    AUR 更新完成!"
echo "================================================================================"
echo ""
echo "  后续步骤:"
echo ""
echo "    # 用户端运行以下命令更新:"
echo "    paru -Syu --noconfirm mimic-node-git"
echo "    # 或"
echo "    yay -Syu --noconfirm mimic-node-git"
echo ""
echo "  或者触发远程 CI/CD 更新 (如果配置了)"
echo ""
echo "  更新后建议运行诊断:"
echo "    sudo mimictl diagnose --verbose"
echo ""
echo "================================================================================"
}
