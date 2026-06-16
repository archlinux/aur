#!/usr/bin/env bash

set -euo pipefail

electron="/usr/lib/electron41/electron"
agent="/usr/lib/zcode-desktop-bin/resources/glm/zcode.cjs"

[[ -x "${electron}" ]] || {
  echo "Missing Electron runtime: ${electron}" >&2
  exit 1
}

[[ -f "${agent}" ]] || {
  echo "Missing ZCode agent bundle: ${agent}" >&2
  exit 1
}

export ELECTRON_RUN_AS_NODE=1
exec "${electron}" "${agent}" "$@"
