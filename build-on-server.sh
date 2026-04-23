#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$repo_dir"

export PKGDEST="${PKGDEST:-$repo_dir/artifacts}"
export SRCDEST="${SRCDEST:-$repo_dir/cache/sources}"
export SRCPKGDEST="${SRCPKGDEST:-$repo_dir/cache/srcpkgs}"
export TPM453_BUILD_JOBS="${TPM453_BUILD_JOBS:-$(nproc)}"

mkdir -p "$PKGDEST" "$SRCDEST" "$SRCPKGDEST"

if [[ "${1:-}" == "--syncdeps" ]]; then
  shift
  exec makepkg -s --noconfirm --cleanbuild "$@"
fi

exec makepkg --cleanbuild "$@"
