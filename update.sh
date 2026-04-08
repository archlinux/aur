#!/usr/bin/env bash
#####################################################################################
# Mimic-Node AUR Update Script
# 自动完成 AUR 包的上传和更新全流程
#####################################################################################

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

info() { echo -e "${GREEN}[INFO]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1" >&2; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }

# 检查是否在 AUR 仓库目录
if [[ ! -d ".git" ]]; then
    error "请在 AUR 仓库目录中执行此脚本"
    exit 1
fi

# 检查远程仓库配置
REMOTE=$(git remote get-url origin 2>/dev/null || echo "")
if [[ ! "$REMOTE" =~ aur\.archlinux\.org ]]; then
    error "当前仓库不是 AUR 仓库: $REMOTE"
    exit 1
fi

info "Mimic-Node AUR 更新脚本"
echo ""

# 检查是否有未提交的更改
if git diff --quiet && git diff --cached --quiet; then
    warn "没有检测到更改，跳过提交"
else
    # 显示更改
    info "检测到更改:"
    git status --short
    echo ""

    # 提交更改
    read -p "是否提交这些更改? [Y/n]: " confirm
    if [[ "$confirm" != [Nn]* ]]; then
        git add -A

        # 获取提交信息
        read -p "输入提交信息 (留空使用默认): " msg
        if [[ -z "$msg" ]]; then
            msg="chore(aur): update package"
        fi

        git commit -m "$msg"
        info "已提交: $msg"
    fi
fi

# 推送到 AUR
info "推送到 AUR..."
git push origin master

info "AUR 更新完成!"

echo ""
echo "=============================================="
info "后续步骤:"
echo "  1. 在服务器上运行: paru -Syu --noconfirm mimic-node-git"
echo "  2. 或者触发远程更新 (如果配置了 CI/CD)"
echo "=============================================="
