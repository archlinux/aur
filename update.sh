#!/bin/bash
#
# update.sh - Update astrbot-git AUR package
#
# This script handles the full update workflow:
#   1. Pull latest from origin (AUR)
#   2. Compute new pkgver using a lightweight partial clone (skipping large file history)
#   3. Bump pkgrel (always, to force rebuild even on hotfix changes)
#   4. Commit and push to both AUR and GitHub mirror
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

BRANCH=$(git symbolic-ref --short HEAD)

echo "=== Updating astrbot-git ==="

echo "[1/5] Fetching latest from AUR..."
git fetch --prune origin

echo "[2/5] Checking for divergence..."
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse origin/"$BRANCH")
BASE=$(git merge-base @ origin/"$BRANCH")

if [ "$LOCAL" = "$REMOTE" ]; then
    echo ">>> Already up to date with AUR."
elif [ "$LOCAL" = "$BASE" ]; then
    echo ">>> Fast-forwarding to latest AUR..."
    git pull origin "$BRANCH"
elif [ "$REMOTE" = "$BASE" ]; then
    echo ">>> Local commits ahead — will push after rebuild."
    git pull --rebase origin "$BRANCH" || {
        echo "❌ Pull with rebase failed. Resolve conflicts manually."
        exit 1
    }
else
    echo "❌ Diverged from AUR. Manual resolution required."
    git status
    exit 1
fi

echo "[3/5] Computing new version (lightweight clone)..."

OLD_VER=$(awk -F= '/^pkgver=/{gsub(/"|'"'"'/, "", $2); print $2; exit}' PKGBUILD | head -1)
OLD_PKGREL=$(awk -F= '/^pkgrel=/{gsub(/"|'"'"'/, "", $2); print $2; exit}' PKGBUILD)

# Use a bare, blob-filtered clone to get commit history without downloading file contents.
# This is extremely fast and entirely avoids downloading large garbage files in the history.
TMP_DIR=$(mktemp -d)
git clone --bare --filter=blob:none --branch dev https://github.com/AstrBotDevs/AstrBot.git "$TMP_DIR" >/dev/null 2>&1
git -C "$TMP_DIR" fetch --tags >/dev/null 2>&1
NEW_VER=$(git -C "$TMP_DIR" describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g')
rm -rf "$TMP_DIR"

[ -n "$NEW_VER" ] || {
    echo "❌ 无法获取最新 pkgver"
    exit 1
}

if [ "$NEW_VER" != "$OLD_VER" ]; then
    echo ">>> 版本变化: ${OLD_VER} → ${NEW_VER}，重置 pkgrel=1"
    NEW_PKGREL=1
else
    echo ">>> 版本未变，递增 pkgrel: ${OLD_PKGREL} → $((OLD_PKGREL + 1))"
    NEW_PKGREL=$((OLD_PKGREL + 1))
fi

echo "[4/5] Updating PKGBUILD and .SRCINFO..."
# Replace only the static pkgver= line (not pkgver() function), then bump pkgrel
sed -i "1,/^pkgver=/{s/^pkgver=.*/pkgver=${NEW_VER}/}" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=${NEW_PKGREL}/" PKGBUILD

rm -rf src/ pkg/
makepkg --printsrcinfo >.SRCINFO

echo "[5/5] Committing and pushing..."

git add -u
if git diff --quiet && git diff --cached --quiet; then
    echo ">>> 没有更改，跳过提交"
else
    git commit -m "update to version $NEW_VER-$NEW_PKGREL"
fi
git push origin "$BRANCH"
if command -v gh >/dev/null 2>&1; then
    gh auth setup-git 2>/dev/null || true
fi
if git push github "$BRANCH" 2>&1; then
    echo ">>> GitHub mirror pushed."
else
    echo "⚠️ GitHub push failed. Manual: git push github $BRANCH"
fi

echo "=== ✅ 完成！版本: $NEW_VER-$NEW_PKGREL ==="
echo ""
echo "在远程服务器上执行以下命令更新:"
echo "  1. 更新/重建 AUR 包"
echo "     ssh ArchDmit 'sudo -u lightjunction paru -S astrbot-git --rebuild --mflags --check --overwrite \"*\" --noconfirm'"
echo ""
echo "  包升级后会自动尝试同步现有实例虚拟环境。"
echo "  如果实例仍像在跑旧代码，可手动执行:"
echo "     ssh ArchDmit 'sudo astrbotctl sync --all'"
