#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

pkgctl version upgrade --no-update-checksums
source PKGBUILD
npm pkg set "dependencies.vite-plus=$pkgver"
npm install --package-lock-only --ignore-scripts --cache "$PWD/.npm-cache"
updpkgsums
makepkg --printsrcinfo > .SRCINFO
git diff --check
git --no-pager diff -- PKGBUILD package.json package-lock.json .SRCINFO
pkgctl build
