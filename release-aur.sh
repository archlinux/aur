#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: ./release-aur.sh [--push] [--chroot]

Options:
  --push    Push master to origin after checks pass and git tree is clean.
  --chroot  Enable clean chroot build during checks (AUR_CHECK_CHROOT=1).
  -h, --help
EOF
}

push_after_checks=0
use_chroot=0

for arg in "$@"; do
  case "$arg" in
    --push) push_after_checks=1 ;;
    --chroot) use_chroot=1 ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "ERROR: unknown argument: $arg" >&2
      usage >&2
      exit 1
      ;;
  esac
done

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$repo_root"

git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
  echo "ERROR: not inside a git repository" >&2
  exit 1
}

current_branch="$(git symbolic-ref --short HEAD)"
if [[ "$current_branch" != "master" ]]; then
  echo "WARN: current branch is '$current_branch' (AUR usually expects 'master')" >&2
fi

if [[ "$use_chroot" == "1" ]]; then
  AUR_CHECK_CHROOT=1 ./check-aur-package.sh
else
  ./check-aur-package.sh
fi

if [[ -n "$(git status --porcelain)" ]]; then
  echo "ERROR: working tree is not clean after checks." >&2
  echo "Please review and commit outstanding changes before release." >&2
  git status --short >&2
  exit 1
fi

echo "Release gate passed: checks OK and git tree clean."

if [[ "$push_after_checks" == "1" ]]; then
  if ! git remote get-url origin >/dev/null 2>&1; then
    echo "ERROR: origin remote is not configured" >&2
    exit 1
  fi
  git push origin master
  echo "Push completed: origin/master updated."
else
  echo "No push performed. Run './release-aur.sh --push' to publish."
fi
