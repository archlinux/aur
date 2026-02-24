#!/usr/bin/env bash
set -euo pipefail

APP_ASAR_DIR="/opt/codex-app-electron-port-bin/app_asar"

if [[ ! -d "${APP_ASAR_DIR}" ]]; then
  echo "Codex app directory not found: ${APP_ASAR_DIR}" >&2
  exit 1
fi

for cmd in electron pnpm realpath cp rm mkdir mktemp sed make python; do
  command -v "${cmd}" >/dev/null 2>&1 || {
    echo "Missing required command: ${cmd}" >&2
    exit 1
  }
done

if ! command -v cc >/dev/null 2>&1 && ! command -v gcc >/dev/null 2>&1; then
  echo "Missing C compiler (install base-devel)." >&2
  exit 1
fi

if [[ $EUID -eq 0 ]]; then
  echo "Warning: running as root is not recommended; build steps will run as root." >&2
fi

if ! command -v codex >/dev/null 2>&1; then
  cat >&2 <<'EOF'
Warning: `codex` CLI not found.
Install it first if the app expects CLI integration:
  pnpm setup
  pnpm add -g @openai/codex
EOF
fi

electron_version="$(electron --version | sed 's/^v//')"
abi_version="$(ELECTRON_RUN_AS_NODE=1 electron -p 'process.versions.modules')"

echo "Electron version: ${electron_version}"
echo "Electron ABI: ${abi_version}"
echo
echo "This will download npm packages and rebuild native modules for system Electron."
echo "You may need to approve build scripts when prompted (pnpm approve-builds)."
echo "If a build fails due to blocked scripts, run: pnpm approve-builds"
echo

work_bsql="$(mktemp -d /tmp/codex-bsql.XXXXXX)"
work_pty="$(mktemp -d /tmp/codex-pty.XXXXXX)"
cleanup() {
  rm -rf "${work_bsql}" "${work_pty}"
}
trap cleanup EXIT

need_privileged_copy=0
if [[ ! -w "${APP_ASAR_DIR}" ]]; then
  need_privileged_copy=1
  if ! command -v sudo >/dev/null 2>&1; then
    echo "Need write access to ${APP_ASAR_DIR}, but 'sudo' is not installed." >&2
    echo "Install sudo or run this script as root." >&2
    exit 1
  fi
fi

copy_into_app() {
  local src_dir="$1"
  local mod_name="$2"

  if [[ "${need_privileged_copy}" -eq 1 ]]; then
    sudo rm -rf "${APP_ASAR_DIR}/node_modules/${mod_name}"
    sudo cp -a "${src_dir}" "${APP_ASAR_DIR}/node_modules/"
  else
    rm -rf "${APP_ASAR_DIR}/node_modules/${mod_name}"
    cp -a "${src_dir}" "${APP_ASAR_DIR}/node_modules/"
  fi
}

rebuild_module() {
  local name="$1"
  local pkg="$2"
  local workdir="$3"

  echo "==> Rebuilding ${name}"
  cd "${workdir}"
  pnpm init -y >/dev/null
  pnpm add "${pkg}"
  pnpm dlx electron-rebuild -v "${electron_version}" -f "${name}"

  local src
  src="$(realpath "node_modules/${name}")"
  copy_into_app "${src}" "${name}"
}

rebuild_module "better-sqlite3" "better-sqlite3@12.5.0" "${work_bsql}"
rebuild_module "node-pty" "node-pty" "${work_pty}"

echo
echo "Native modules were rebuilt for Electron ${electron_version} (ABI ${abi_version})."
echo "Start the app with: codex-app-electron-port-bin"
