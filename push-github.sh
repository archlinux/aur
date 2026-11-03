#!/usr/bin/env bash
# Commit tracked packaging files and push to GitHub (origin). Usage: ./push-github.sh "commit message"
set -euo pipefail
cd "$(dirname "$0")"
msg=${1:?usage: $0 "commit message"}

[ "$(git symbolic-ref --short HEAD)" = master ] || git branch -M master
./gensrcinfo.sh
git add PKGBUILD .SRCINFO LICENSE .gitignore gensrcinfo.sh publish.sh push-github.sh
git diff --cached --quiet || git commit -m "$msg"
git push -u origin master
