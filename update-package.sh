#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

update_checksums=0
update_memprof_limits=0

while (( $# > 0 )); do
  case "$1" in
    -h|--help)
      cat <<'EOF'
Usage: ./update-package.sh [--update-checksums] [--update-memprof-limits]

Updates pkgver via pkgctl, refreshes pinned Git commit variables from
.nvchecker.toml, and regenerates .SRCINFO. The memprof-limits pin is kept by
default because Opengrep requires the OCaml 5-compatible fork commit. Checksums
are skipped by default because this package uses SKIP for Git sources.
EOF
      exit 0
      ;;
    --update-checksums)
      update_checksums=1
      ;;
    --update-memprof-limits)
      update_memprof_limits=1
      ;;
    *)
      printf 'unexpected argument: %s\n' "$1" >&2
      exit 1
      ;;
  esac
  shift
done

for command in pkgctl nvchecker jq sed makepkg; do
  if ! command -v "${command}" >/dev/null 2>&1; then
    printf 'missing required command: %s\n' "${command}" >&2
    exit 1
  fi
done

if (( update_checksums )) && ! command -v updpkgsums >/dev/null 2>&1; then
  printf 'missing required command: updpkgsums\n' >&2
  exit 1
fi

pkgctl version upgrade --no-update-checksums

nvchecker --file .nvchecker.toml --logger json |
  jq --raw-output '
    select((.event == "updated") or (.event == "up-to-date"))
    | select(.name | startswith("opengrep:_"))
    | [(.name | sub("^opengrep:"; "")), (.revision // .version)]
    | @tsv
  ' |
  while IFS=$'\t' read -r variable commit; do
    [[ ${variable} =~ ^_[A-Za-z0-9_]+_commit$ ]] || continue
    [[ ${variable} != _memprof_limits_commit ]] || (( update_memprof_limits )) || continue
    [[ ${commit} =~ ^[0-9a-f]{40}$ ]] || continue
    sed -i -E "s/^(${variable}=)[0-9a-f]{40}$/\\1${commit}/" PKGBUILD
  done

if (( update_checksums )); then
  updpkgsums
fi

makepkg --printsrcinfo > .SRCINFO
