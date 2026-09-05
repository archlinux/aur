#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
wheel="$(find "${script_dir}" -maxdepth 1 -type f -name 'opensquilla-*-py3-none-any.whl' -print -quit)"
uv_bin="$(command -v uv 2>/dev/null || true)"

if [[ -z "${uv_bin}" && -n "${HOME:-}" && -x "${HOME}/.local/bin/uv" ]]; then
  uv_bin="${HOME}/.local/bin/uv"
fi

[[ -n "${wheel}" ]] || {
  echo "Missing OpenSquilla wheel in ${script_dir}" >&2
  exit 1
}

[[ -n "${uv_bin}" ]] || {
  echo "Missing uv runtime: required to launch the OpenSquilla gateway" >&2
  exit 1
}

exec "${uv_bin}" run \
  --with "opensquilla[recommended,mcp,msg,matrix,document-extras] @ ${wheel}" \
  opensquilla \
  "$@"
