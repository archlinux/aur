#!/usr/bin/env bash
# Commit PKGBUILD/.SRCINFO/LICENSE and push to the AUR. Usage: ./publish.sh "commit message"
set -euo pipefail
cd "$(dirname "$0")"
msg=${1:?usage: $0 "commit message"}
remote=ssh://aur@aur.archlinux.org/rabbitvcs-dolphin-git.git

[ -d .git ] || git -c init.defaultBranch=master init
git remote get-url aur >/dev/null 2>&1 || git remote add aur "$remote"
[ "$(git symbolic-ref --short HEAD)" = master ] || git branch -M master  # AUR only accepts master

./gensrcinfo.sh
git add PKGBUILD .SRCINFO LICENSE
git diff --cached --quiet && { echo "nothing to commit"; exit 0; }
git commit -m "$msg"
git push aur master
