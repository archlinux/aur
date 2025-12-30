#!/bin/bash

# 配置仓库信息
REPO_USER="lbjlaq"
REPO_NAME="Antigravity-Manager"

echo "==> 正在检查 GitHub 最新版本..."

# 1. 获取 GitHub 最新 Release 版本号
# 使用 GitHub API 获取 latest release 的 tag_name
LATEST_TAG=$(curl -s "https://api.github.com/repos/$REPO_USER/$REPO_NAME/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

# 获取失败处理
if [ -z "$LATEST_TAG" ]; then
    echo "!! 错误: 无法获取最新版本信息，请检查网络或 GitHub API 限制。"
    exit 1
fi

# 去掉可能存在的 'v' 前缀 (例如 v3.3.6 -> 3.3.6)
NEW_VER=${LATEST_TAG#v}

# 2. 读取当前 PKGBUILD 中的版本
CURRENT_VER=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)

echo "   本地版本: $CURRENT_VER"
echo "   最新版本: $NEW_VER"

if [ "$NEW_VER" == "$CURRENT_VER" ]; then
    echo "==> 当前已是最新版本，无需更新。"
    exit 0
fi

echo "==> 发现新版本！开始执行更新流程..."

# 3. 更新 PKGBUILD
# 修改 pkgver
sed -i "s/^pkgver=.*/pkgver=$NEW_VER/" PKGBUILD
# 重置 pkgrel 为 1
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

echo "   已更新 PKGBUILD 版本号"

# 4. 更新校验和 (需要 pacman-contrib 包)
if command -v updpkgsums >/dev/null 2>&1; then
    echo "==> 正在下载源文件并更新 sha256sums..."
    updpkgsums
else
    echo "!! 警告: 未找到 'updpkgsums' 命令。请安装 pacman-contrib (sudo pacman -S pacman-contrib)，否则需要手动更新校验和。"
fi

# 5. 生成 .SRCINFO
echo "==> 正在生成 .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "==> 更新完成！准备就绪。" 
echo "    版本: $NEW_VER"
echo "    后续操作: git commit -am \"Update to $NEW_VER\" && git push"