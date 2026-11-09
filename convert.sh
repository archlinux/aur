#!/usr/bin/env bash
# Convert the official Windows-only CatPaw (妙手) build into a Linux Electron app.
# Sourced inputs are passed via environment variables by PKGBUILD; this script
# never touches the network.
set -Eeuo pipefail

: "${APP_EXE:?APP_EXE not set}"
: "${INNOEXTRACT:?INNOEXTRACT not set}"
: "${ELECTRON_ZIP:?ELECTRON_ZIP not set}"
: "${ELECTRON_HEADERS_TGZ:?ELECTRON_HEADERS_TGZ not set}"
: "${NODE_TARBALL:?NODE_TARBALL not set}"
: "${PYTHON_TARBALL:?PYTHON_TARBALL not set}"
: "${KOFFI_TGZ:?KOFFI_TGZ not set}"
: "${SHARP_TGZ:?SHARP_TGZ not set}"
: "${SHARP_LIBVIPS_TGZ:?SHARP_LIBVIPS_TGZ not set}"
: "${CANVAS_TGZ:?CANVAS_TGZ not set}"
: "${WECOM_TGZ:?WECOM_TGZ not set}"
: "${BETTER_SQLITE3_TGZ:?BETTER_SQLITE3_TGZ not set}"
: "${FFMPEG_LINUX_TGZ:?FFMPEG_LINUX_TGZ not set}"
: "${NODE_PTY_TGZ:?NODE_PTY_TGZ not set}"
: "${NODE_ADDON_API_TGZ:?NODE_ADDON_API_TGZ not set}"
: "${BUFFERUTIL_TGZ:?BUFFERUTIL_TGZ not set}"
: "${UTF8_VALIDATE_TGZ:?UTF8_VALIDATE_TGZ not set}"
: "${CATPAW_CLI_BIN:?CATPAW_CLI_BIN not set}"
: "${AGENT_BROWSER_TGZ:?AGENT_BROWSER_TGZ not set}"
: "${OUT_DIR:?OUT_DIR not set}"
: "${ELECTRON_VER:?ELECTRON_VER not set}"
: "${NODE_VER:?NODE_VER not set}"
: "${PYTHON_VER:?PYTHON_VER not set}"

APP_NAME="${APP_NAME:-catpaw-cn}"
APP_ID="${APP_ID:-com.catx.catpaw}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORK_DIR="${WORK_DIR:-$(mktemp -d "${TMPDIR:-/tmp}/catpaw-cn-build.XXXXXX")}"
if [ "${KEEP_WORK:-0}" != "1" ]; then
  trap 'rm -rf "${WORK_DIR}"' EXIT
fi

info() { printf '==> %s\n' "$*"; }
die() { printf 'error: %s\n' "$*" >&2; exit 1; }

extract_exe() {
  local exe="$1" dest="${WORK_DIR}/win"
  info "Extracting Windows installer (Inno Setup)"
  install -dm755 "${dest}"
  "${INNOEXTRACT}" -d "${dest}" "${exe}" >/dev/null ||
    die "innoextract failed on ${exe}"

  local asar_dirs
  mapfile -t asar_dirs < <(find "${dest}" -type f -name 'app.asar' -printf '%h\n')
  [ "${#asar_dirs[@]}" -eq 1 ] ||
    die "expected exactly one app.asar in ${exe}, found ${#asar_dirs[@]}"
  APP_RESOURCES="${asar_dirs[0]}"
}

stage_electron() {
  local zip="$1" out="$2"
  info "Staging Electron Linux runtime"
  install -dm755 "${out}"
  unzip -q "${zip}" -d "${out}"
  [ -x "${out}/electron" ] || die "electron binary missing from ${zip}"
  mv "${out}/electron" "${out}/${APP_NAME}"
  # chrome-sandbox only works when installed root:root 4755, which a package
  # cannot guarantee; the launcher always uses --no-sandbox instead.
  rm -f "${out}/chrome-sandbox"
  rm -f "${out}/resources/default_app.asar"
  touch "${out}/resources/.keep"
}

copy_payload() {
  local res="$1" out="$2"
  info "Copying application payload"
  install -dm755 "${out}/resources"
  cp "${res}/app.asar" "${out}/resources/app.asar"
  cp -a "${res}/app.asar.unpacked" "${out}/resources/app.asar.unpacked"

  # product.json lives next to the asar so the app can read branding at startup.
  # The macOS bundle keeps it under app/, the Windows payload at resources root.
  install -dm755 "${out}/resources/app"
  if [ -f "${res}/app/product.json" ]; then
    cp "${res}/app/product.json" "${out}/resources/app/product.json"
  else
    cp "${res}/product.json" "${out}/resources/app/product.json"
    cp "${res}/product.json" "${out}/resources/product.json"
  fi

  local d
  for d in cli cli-apps app-extensions skills wasm; do
    [ -d "${res}/${d}" ] && cp -a "${res}/${d}" "${out}/resources/${d}"
  done
  for d in cli skills; do
    [ -d "${out}/resources/${d}" ] || die "required resources/${d} directory missing"
  done
  [ -f "${out}/resources/cli/catpaw-cli.js" ] ||
    die "resources/cli/catpaw-cli.js missing (paw CLI would be unusable)"

  cp "${res}/icon.png" "${out}/resources/icon.png"
  cp "${res}/tray-iconTemplate.png" "${out}/resources/tray-iconTemplate.png"
  cp "${res}/tray-iconTemplate@2x.png" "${out}/resources/tray-iconTemplate@2x.png"

  # Drop platform-only artifacts: code-sign sidecars, .lproj bundles, the
  # native helper directory (dylib/PE sidecar) and the Windows powershell runtime.
  find "${out}/resources" -name '*:com.apple.cs.*' -type f -delete
  find "${out}/resources" -name '*.lproj' -type d -prune -exec rm -rf {} + || true
  rm -rf "${out}/resources/native"            # libKeyboardHelper + xlsx-sidecar
  rm -rf "${out}/resources/runtimes"          # replaced by write_runtimes()
  rm -f "${out}/resources/bin/paw" "${out}/resources/bin/paw.cmd"
}

pkg_extract() {
  local tgz="$1" dest="$2"
  install -dm755 "${dest}"
  tar -xzf "${tgz}" -C "${dest}" --strip-components=1
}

build_gyp_module() {
  local tgz="$1" name="$2" extra_env=""
  local work="${WORK_DIR}/gyp-${name}"
  info "Building native module ${name} against Electron headers"
  pkg_extract "${tgz}" "${work}"
  if [ "${name}" = "node-pty" ]; then
    pkg_extract "${NODE_ADDON_API_TGZ}" "${work}/node_modules/node-addon-api"
  fi
  (
    cd "${work}"
    node-gyp rebuild \
      --nodedir="${WORK_DIR}/headers/node_headers" \
      --target_arch=x64 \
      --release
  ) >"${WORK_DIR}/${name}.build.log" 2>&1 || {
    tail -n 40 "${WORK_DIR}/${name}.build.log" >&2
    die "native build failed for ${name}"
  }
}

replace_native_modules() {
  local app="${1}" nm="${1}/resources/app.asar.unpacked/node_modules"
  [ -d "${nm}" ] || die "app.asar.unpacked/node_modules missing"

  info "Purging non-Linux native artifacts"
  rm -rf "${nm}"/@img/sharp-* "${nm}"/@img/sharp-libvips-*
  rm -rf "${nm}"/@napi-rs/canvas-*
  rm -rf "${nm}"/@koromix/koffi-*
  rm -rf "${nm}/koffi/node_modules/@koromix"
  rm -rf "${nm}"/@wecom/cli-*
  rm -rf "${nm}"/@catpaw/office-runtime-*
  rm -rf "${nm}"/@vscode/windows-*
  rm -f "${nm}"/agent-browser/bin/agent-browser-*
  # Windows-only helpers that the Inno Setup installer ships alongside the app.
  rm -f "${nm}/@catpaw/agent-sdk/bin/catpaw-cli.exe"
  rm -rf "${nm}/node-pty/build/Release/conpty" "${nm}/node-pty/build/Release/winpty"
  rm -rf "${nm}/set-global-proxy/lib/win"
  local d
  for d in "${nm}"/@ffmpeg-installer/*; do
    case "$(basename "${d}")" in linux-*) ;; *) rm -rf "${d}" ;; esac
  done
  if [ -d "${nm}/@esbuild" ]; then
    for d in "${nm}"/@esbuild/*; do
      case "$(basename "${d}")" in linux-x64) ;; *) rm -rf "${d}" ;; esac
    done
    # esbuild's shim binary is a foreign-arch executable; use the Linux
    # counterpart from the platform package that is also bundled.
    [ -f "${nm}/@esbuild/linux-x64/bin/esbuild" ] ||
      die "esbuild linux-x64 binary missing; refusing to keep a foreign shim"
    install -m755 "${nm}/@esbuild/linux-x64/bin/esbuild" \
      "${nm}/esbuild/bin/esbuild"
  fi
  rm -rf "${nm}/node-pty/prebuilds" "${nm}/node-pty/bin"
  rm -rf "${nm}/bufferutil/prebuilds" "${nm}/bufferutil/bin"
  rm -rf "${nm}/utf-8-validate/prebuilds" "${nm}/utf-8-validate/bin"
  find "${nm}/node-pty" -name '*.node' -path '*/build/*' -delete || true

  # node-pty (compiled from source, Electron ABI 146)
  build_gyp_module "${NODE_PTY_TGZ}" node-pty
  install -dm755 "${nm}/node-pty/build/Release"
  cp "${WORK_DIR}/gyp-node-pty/build/Release/pty.node" \
     "${nm}/node-pty/build/Release/pty.node"
  # spawn-helper is a Mach-O executable shipped for macOS; Linux uses posix_spawn.
  find "${nm}/node-pty" -name 'spawn-helper' -delete

  # better-sqlite3 (official prebuilt for Electron v146 linux-x64).
  # Its release tarball already starts at build/Release, so no strip.
  install -dm755 "${WORK_DIR}/better-sqlite3"
  tar -xzf "${BETTER_SQLITE3_TGZ}" -C "${WORK_DIR}/better-sqlite3"
  [ -f "${WORK_DIR}/better-sqlite3/build/Release/better_sqlite3.node" ] ||
    die "better_sqlite3.node missing from ${BETTER_SQLITE3_TGZ}"
  install -dm755 "${nm}/better-sqlite3/build/Release"
  cp "${WORK_DIR}/better-sqlite3/build/Release/better_sqlite3.node" \
     "${nm}/better-sqlite3/build/Release/better_sqlite3.node"

  # bufferutil / utf-8-validate (optional ws speedups, built from source)
  build_gyp_module "${BUFFERUTIL_TGZ}" bufferutil
  install -dm755 "${nm}/bufferutil/build/Release"
  cp "${WORK_DIR}/gyp-bufferutil/build/Release/bufferutil.node" \
     "${nm}/bufferutil/build/Release/bufferutil.node"

  build_gyp_module "${UTF8_VALIDATE_TGZ}" utf-8-validate
  install -dm755 "${nm}/utf-8-validate/build/Release"
  cp "${WORK_DIR}/gyp-utf-8-validate/build/Release/validation.node" \
     "${nm}/utf-8-validate/build/Release/validation.node"

  # koffi
  pkg_extract "${KOFFI_TGZ}" "${nm}/@koromix/koffi-linux-x64"
  pkg_extract "${KOFFI_TGZ}" "${nm}/koffi/node_modules/@koromix/koffi-linux-x64"

  # sharp + libvips
  pkg_extract "${SHARP_TGZ}" "${nm}/@img/sharp-linux-x64"
  pkg_extract "${SHARP_LIBVIPS_TGZ}" "${nm}/@img/sharp-libvips-linux-x64"

  # @napi-rs/canvas
  pkg_extract "${CANVAS_TGZ}" "${nm}/@napi-rs/canvas-linux-x64-gnu"

  # WeCom customer-service CLI
  pkg_extract "${WECOM_TGZ}" "${nm}/@wecom/cli-linux-x64"
  chmod 755 "${nm}/@wecom/cli-linux-x64/bin/wecom-cli"

  # ffmpeg for audio/video conversion helpers
  pkg_extract "${FFMPEG_LINUX_TGZ}" "${nm}/@ffmpeg-installer/linux-x64"
  chmod 755 "${nm}/@ffmpeg-installer/linux-x64/ffmpeg"

  # bundled agent-browser (npm package ships the platform binaries) and
  # catpaw-cli binary matching the SDK version bundled in the app.
  mkdir -p "${WORK_DIR}/agent-browser"
  tar -xzf "${AGENT_BROWSER_TGZ}" -C "${WORK_DIR}/agent-browser" \
    package/bin/agent-browser-linux-x64
  install -m755 "${WORK_DIR}/agent-browser/package/bin/agent-browser-linux-x64" \
    "${nm}/agent-browser/bin/agent-browser-linux-x64"
  install -m755 "${CATPAW_CLI_BIN}" "${nm}/@catpaw/agent-sdk/bin/catpaw-cli"

  # Normalize permissions: native modules must be readable/executable but the
  # packaged app is not stripped, so keep their original modes.
  find "${nm}" -type f -name '*.node' -exec chmod 755 {} +
}

write_runtimes() {
  local app="$1"
  local run="${app}/resources/runtimes"
  info "Writing Linux managed-runtime manifest"
  install -dm755 "${run}"

  local node_archive="node-v${NODE_VER}-linux-x64.tar.gz"
  local python_archive="cpython-${PYTHON_VER}-linux-x64-install_only.tar.gz"
  local python_bin="bin/python$(printf '%s' "${PYTHON_VER}" | cut -d. -f1,2)"
  cp "${NODE_TARBALL}" "${run}/${node_archive}"
  cp "${PYTHON_TARBALL}" "${run}/${python_archive}"

  local node_sha python_sha
  node_sha="$(sha256sum "${run}/${node_archive}" | cut -d' ' -f1)"
  python_sha="$(sha256sum "${run}/${python_archive}" | cut -d' ' -f1)"

  cat >"${run}/manifest.json" <<EOF
{
  "schemaVersion": 2,
  "platform": "linux",
  "arch": "x64",
  "assets": [
    {
      "id": "node",
      "version": "${NODE_VER}",
      "archiveFile": "${node_archive}",
      "archiveType": "tar.gz",
      "stripComponents": 1,
      "sha256": "${node_sha}",
      "executableRelativePath": "bin/node",
      "pathDirs": [
        "bin"
      ],
      "maxFiles": 12000,
      "maxUncompressedBytes": 419430400
    },
    {
      "id": "python",
      "version": "${PYTHON_VER}",
      "archiveFile": "${python_archive}",
      "archiveType": "tar.gz",
      "stripComponents": 1,
      "sha256": "${python_sha}",
      "executableRelativePath": "${python_bin}",
      "pathDirs": [
        "bin"
      ],
      "maxFiles": 10000,
      "maxUncompressedBytes": 629145600
    }
  ]
}
EOF
}

patch_skill_manifests() {
  local app="$1"
  info "Generating Linux skill dependency manifests"
  node "${SCRIPT_DIR}/patch-skill-manifests.js" "${app}/resources/skills"
}

write_paw() {
  local app="$1"
  install -dm755 "${app}/resources/bin"
  cat >"${app}/resources/bin/paw" <<'PAW'
#!/bin/sh
# CatPaw CLI launcher (Linux port): uses Electron's embedded Node.js runtime.
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:${PATH:-}"

SOURCE="$0"
while [ -L "$SOURCE" ]; do
  DIR="$(cd "${SOURCE%/*}" && pwd)"
  SOURCE="$(readlink "$SOURCE")"
  case "$SOURCE" in /*) ;; *) SOURCE="$DIR/$SOURCE" ;; esac
done
SCRIPT_DIR="$(cd "${SOURCE%/*}" && pwd)"
RESOURCES_DIR="${SCRIPT_DIR%/*}"
CLI_JS="$RESOURCES_DIR/cli/catpaw-cli.js"
if [ ! -f "$CLI_JS" ]; then
  echo "Error: Cannot find CLI script at $CLI_JS" >&2
  exit 1
fi
ELECTRON_BIN="$RESOURCES_DIR/../APP_NAME"
if [ ! -x "$ELECTRON_BIN" ]; then
  echo "Error: Electron binary not found at $ELECTRON_BIN" >&2
  exit 1
fi
ELECTRON_RUN_AS_NODE=1 exec "$ELECTRON_BIN" "$CLI_JS" "$@"
PAW
  sed -i "s|APP_NAME|${APP_NAME}|g" "${app}/resources/bin/paw"
  chmod 755 "${app}/resources/bin/paw"
}

write_metadata() {
  local out="$1"
  install -dm755 "${out}/.port"
  cat >"${out}/.port/build-info.json" <<EOF
{
  "appId": "${APP_ID}",
  "displayName": "妙手",
  "electronVersion": "${ELECTRON_VER}",
  "nodeRuntime": "${NODE_VER}",
  "pythonRuntime": "${PYTHON_VER}",
  "platform": "linux-x64"
}
EOF
}

main() {
  extract_exe "${APP_EXE}"
  install -dm755 "${WORK_DIR}/headers"
  tar -xzf "${ELECTRON_HEADERS_TGZ}" -C "${WORK_DIR}/headers"
  [ -f "${WORK_DIR}/headers/node_headers/include/node/config.gypi" ] ||
    die "Electron headers tarball layout unexpected"

  rm -rf "${OUT_DIR}"
  stage_electron "${ELECTRON_ZIP}" "${OUT_DIR}"
  copy_payload "${APP_RESOURCES}" "${OUT_DIR}"
  patch_skill_manifests "${OUT_DIR}"
  replace_native_modules "${OUT_DIR}"
  info "Registering Linux replacement files in the asar header"
  node "${SCRIPT_DIR}/repack-asar.js" \
    "${OUT_DIR}/resources/app.asar" \
    "${OUT_DIR}/resources/app.asar.unpacked"
  info "Disabling the invisible-overlay window on Linux"
  node "${SCRIPT_DIR}/patch-overlay-window.js" "${OUT_DIR}/resources/app.asar" ||
    die "overlay window patch failed (upstream bundle changed?)"
  write_runtimes "${OUT_DIR}"
  write_paw "${OUT_DIR}"
  write_metadata "${OUT_DIR}"

  info "Linux app staged at ${OUT_DIR}"
}

main "$@"
