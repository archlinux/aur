#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

for command in pkgctl nvchecker jq sed updpkgsums makepkg; do
  if ! command -v "${command}" >/dev/null 2>&1; then
    printf 'missing required command: %s\n' "${command}" >&2
    exit 1
  fi
done

pkgctl version upgrade --no-update-checksums

nvchecker --file .nvchecker.toml --logger json |
  jq --raw-output '
    select((.event == "updated") or (.event == "up-to-date"))
    | select(.name == "opengrep-bin:_interfaces_commit")
    | .revision // .version
  ' |
  while read -r commit; do
    [[ ${commit} =~ ^[0-9a-f]{40}$ ]] || continue
    sed -i -E "s/^(_interfaces_commit=)[0-9a-f]{40}$/\\1${commit}/" PKGBUILD
  done

updpkgsums
makepkg --printsrcinfo > .SRCINFO
