#!/usr/bin/env bash
# Assemble a Linux WorkBuddy app from official artifacts.
#
#   WIN_ZIP      official win32-x64 archive: the application payload. The JS in
#                app.asar is platform neutral, and the archive already carries
#                the Linux koffi / node-pty / os-bridge builds used on x64.
#   HOST_DEB     official domestic Linux deb: the custom Electron runtime
#                (workbuddyStorage), the Node/Python session runtimes, and the
#                Linux CLI helper binaries (ripgrep, genie-trash).
#   SANDBOX_TGZ  @tencent-ai/sandbox-cli-linux-<machine> at the version the app
#                pins, so the sandbox protocol matches the shipped CLI.
#   HARNESS_TGZ  @tencent-ai/agent-harness-linux-<machine> at the version the
#                bundled @genie/agent-harness pins.
#
# Everything above arrives through source=() with a sha256. This script never
# touches the network.
set -Eeuo pipefail

: "${WIN_ZIP:?WIN_ZIP not set}"
: "${HOST_DEB:?HOST_DEB not set}"
: "${SANDBOX_TGZ:?SANDBOX_TGZ not set}"
: "${HARNESS_TGZ:?HARNESS_TGZ not set}"
: "${MACHINE:?MACHINE not set (x64 or arm64)}"
: "${EXPECTED_ELECTRON:?EXPECTED_ELECTRON not set}"
: "${EXPECTED_SANDBOX:?EXPECTED_SANDBOX not set}"
: "${EXPECTED_HARNESS:?EXPECTED_HARNESS not set}"
: "${WORK_DIR:?WORK_DIR not set}"
: "${OUT_DIR:?OUT_DIR not set}"
: "${SCRIPT_DIR:?SCRIPT_DIR not set}"

case "${MACHINE}" in
  x64 | arm64) ;;
  *) printf 'unsupported machine: %s\n' "${MACHINE}" >&2; exit 1 ;;
esac
koffi_platform="linux_${MACHINE}"

info() { printf '==> %s\n' "$*"; }
die() { printf 'error: %s\n' "$*" >&2; exit 1; }

pkg_version() {
  node -e 'process.stdout.write(require(process.argv[1] + "/package.json").version)' "$1"
}

require_same_version() {
  local payload="$1" donor="$2" what="$3"
  local a b
  a="$(pkg_version "${payload}")"
  b="$(pkg_version "${donor}")"
  [ "${a}" = "${b}" ] || die "${what} version drift: app payload ${a}, Linux donor ${b}"
}

rm -rf "${WORK_DIR}" "${OUT_DIR}"
mkdir -p "${WORK_DIR}"

# ---------------------------------------------------------------------------
# 1. Donor Linux runtime
# ---------------------------------------------------------------------------
info "Extracting the official Linux donor"
mkdir -p "${WORK_DIR}/deb"
bsdtar -C "${WORK_DIR}/deb" -xf "${HOST_DEB}"
data_archive="$(find "${WORK_DIR}/deb" -maxdepth 1 -name 'data.tar.*' -print)"
[ -n "${data_archive}" ] && [ "$(printf '%s\n' "${data_archive}" | wc -l)" -eq 1 ] ||
  die "unexpected deb layout: ${data_archive}"

mkdir -p "${WORK_DIR}/donor"
bsdtar -C "${WORK_DIR}/donor" -xf "${data_archive}"
host="${WORK_DIR}/donor/opt/WorkBuddy"
[ -x "${host}/workbuddy" ] || die "donor deb lacks opt/WorkBuddy/workbuddy"

electron_version="$(cat "${host}/version")"
case "${electron_version}" in
  "${EXPECTED_ELECTRON}-"*) ;;
  *) die "unexpected donor Electron ${electron_version}, expected ${EXPECTED_ELECTRON}-<revision>" ;;
esac
grep -aq workbuddyStorage "${host}/workbuddy" ||
  die "donor Electron lacks the workbuddyStorage native binding required at sign-in"

# ---------------------------------------------------------------------------
# 2. Electron shell
# ---------------------------------------------------------------------------
info "Assembling the Electron shell"
app="${WORK_DIR}/app"
mkdir -p "${app}/resources"
for entry in "${host}"/*; do
  [ "$(basename "${entry}")" = resources ] && continue
  cp -a "${entry}" "${app}/"
done
chmod 4755 "${app}/chrome-sandbox"

host_resources="${host}/resources"
resources="${app}/resources"
cp -a "${host_resources}/runtime" "${resources}/runtime"
# Linux-only assets the Windows archive does not contain.
for asset in tray-linux.png tray-linux@2x.png apparmor-profile wb-guest-sdk; do
  [ -e "${host_resources}/${asset}" ] && cp -a "${host_resources}/${asset}" "${resources}/${asset}"
done

# ---------------------------------------------------------------------------
# 3. Application payload
# ---------------------------------------------------------------------------
info "Extracting the Windows application payload"
mkdir -p "${WORK_DIR}/win"
# unzip exits 11 if any single pattern matches nothing, so required and
# optional entries are extracted separately.
unzip -q "${WIN_ZIP}" -d "${WORK_DIR}/win" \
  'resources/app.asar' \
  'resources/app.asar.unpacked/*' ||
  die "missing resources/app.asar in ${WIN_ZIP}"
win_resources="${WORK_DIR}/win/resources"
[ -f "${win_resources}/app.asar" ] || die "no resources/app.asar in ${WIN_ZIP}"

node "${SCRIPT_DIR}/asar.cjs" unpack "${win_resources}/app.asar" "${resources}/app.asar.unpacked"

# Report pages are plain assets belonging to the payload, not the donor.
unzip -q "${WIN_ZIP}" -d "${WORK_DIR}/win" \
  'resources/conversation-report.html' \
  'resources/startup-report.html' 2>/dev/null || true
for page in conversation-report.html startup-report.html; do
  if [ -f "${win_resources}/${page}" ]; then
    cp -a "${win_resources}/${page}" "${resources}/"
  fi
done

# ---------------------------------------------------------------------------
# 4. Linux native modules
# ---------------------------------------------------------------------------
info "Installing Linux native modules"
payload="${resources}/app.asar.unpacked"
stock="${host_resources}/app.asar.unpacked"

# koffi ships every platform build; the Windows archive only carries win32.
for base in "${payload}" "${payload}/cli"; do
  [ -d "${base}/node_modules/koffi" ] || continue
  require_same_version "${base}/node_modules/koffi" "${stock}/node_modules/koffi" koffi
  [ -d "${stock}/node_modules/koffi/build/koffi/${koffi_platform}" ] ||
    die "donor koffi lacks ${koffi_platform}"
  mkdir -p "${base}/node_modules/koffi/build/koffi/${koffi_platform}"
  cp -a "${stock}/node_modules/koffi/build/koffi/${koffi_platform}/." \
    "${base}/node_modules/koffi/build/koffi/${koffi_platform}/"
done

# node-pty has no prebuilt Linux binary; the donor ships a local build.
if [ -d "${payload}/node_modules/node-pty" ]; then
  require_same_version "${payload}/node_modules/node-pty" "${stock}/node_modules/node-pty" node-pty
  rm -rf "${payload}/node_modules/node-pty/build"
  cp -a "${stock}/node_modules/node-pty/build" "${payload}/node_modules/node-pty/build"
fi

# Qimei telemetry binding is shipped as a compiled addon per platform.
if [ -d "${payload}/node_modules/@tencent/qimei-node" ]; then
  require_same_version "${payload}/node_modules/@tencent/qimei-node" \
    "${stock}/node_modules/@tencent/qimei-node" qimei-node
  rm -rf "${payload}/node_modules/@tencent/qimei-node/build"
  cp -a "${stock}/node_modules/@tencent/qimei-node/build" \
    "${payload}/node_modules/@tencent/qimei-node/build"
fi

# The docs engine is a separately built native SDK. Upstream publishes no
# Linux build for the current version, so the donor's Linux binary is used;
# if no donor binary exists the feature is simply absent.
if [ -d "${payload}/node_modules/@tencent/tencent-docs-ai-engine" ]; then
  docs_bin="${payload}/node_modules/@tencent/tencent-docs-ai-engine/bin"
  donor_docs="${stock}/node_modules/@tencent/tencent-docs-ai-engine/bin/linux-${MACHINE}"
  if [ -d "${donor_docs}" ]; then
    payload_docs="$(pkg_version "${payload}/node_modules/@tencent/tencent-docs-ai-engine")"
    donor_docs_version="$(pkg_version "${stock}/node_modules/@tencent/tencent-docs-ai-engine")"
    if [ "${payload_docs}" = "${donor_docs_version}" ]; then
      cp -a "${donor_docs}" "${docs_bin}/"
    else
      printf '    docs engine: payload %s, donor SDK %s (Linux SDK reused)\n' \
        "${payload_docs}" "${donor_docs_version}"
      cp -a "${donor_docs}" "${docs_bin}/"
    fi
  fi
fi

# The CLI carries its own @lydell/node-pty; give it the platform package too.
if [ -d "${payload}/node_modules/@lydell/node-pty-linux-${MACHINE}" ] &&
  [ -d "${payload}/cli/node_modules/@lydell/node-pty" ] &&
  [ ! -d "${payload}/cli/node_modules/@lydell/node-pty-linux-${MACHINE}" ]; then
  cp -a "${payload}/node_modules/@lydell/node-pty-linux-${MACHINE}" \
    "${payload}/cli/node_modules/@lydell/"
fi

# ---------------------------------------------------------------------------
# 5. Linux CLI vendor binaries
# ---------------------------------------------------------------------------
info "Installing Linux CLI helpers"
# Upstream keeps the sandbox binaries under a versioned directory and picks the
# newest one; write the pinned version there for the same layout.
rm -rf "${payload}/cli/vendor/sandbox"
mkdir -p "${WORK_DIR}/sandbox"
tar -xzf "${SANDBOX_TGZ}" -C "${WORK_DIR}/sandbox"
[ -d "${WORK_DIR}/sandbox/package/bin" ] || die "unexpected sandbox-cli layout"
sandbox_version="$(pkg_version "${WORK_DIR}/sandbox/package")"
[ "${sandbox_version}" = "${EXPECTED_SANDBOX}" ] ||
  die "sandbox-cli version drift: app expects ${EXPECTED_SANDBOX}, tarball is ${sandbox_version}"
mkdir -p "${payload}/cli/vendor/sandbox/${sandbox_version}"
cp -a "${WORK_DIR}/sandbox/package/bin/." \
  "${payload}/cli/vendor/sandbox/${sandbox_version}/"
find "${payload}/cli/vendor/sandbox/${sandbox_version}" -type f -exec chmod 755 {} +

# Windows archives carry no executable bit; the app spawns CLI entry points,
# plugin scripts and shell shims directly, so restore it where the first line
# is a shebang (what npm itself does when installing packages).
shebang_files="$(grep -rlI -m1 '^#!' "${payload}" 2>/dev/null || true)"
[ -n "${shebang_files}" ] || die "no shebang scripts found in payload"
while IFS= read -r script; do
  [ -x "${script}" ] || chmod 755 "${script}"
done <<< "${shebang_files}"

rm -rf "${payload}/cli/vendor/genie-trash"
[ -f "${stock}/cli/vendor/genie-trash/linux-${MACHINE}" ] ||
  die "donor lacks cli/vendor/genie-trash/linux-${MACHINE}"
mkdir -p "${payload}/cli/vendor/genie-trash"
cp -a "${stock}/cli/vendor/genie-trash/linux-${MACHINE}" \
  "${payload}/cli/vendor/genie-trash/linux-${MACHINE}"
chmod 755 "${payload}/cli/vendor/genie-trash/linux-${MACHINE}"

rm -rf "${payload}/cli/vendor/ripgrep"
if [ -d "${stock}/cli/vendor/ripgrep/${MACHINE}-linux" ]; then
  mkdir -p "${payload}/cli/vendor/ripgrep"
  cp -a "${stock}/cli/vendor/ripgrep/${MACHINE}-linux" \
    "${payload}/cli/vendor/ripgrep/${MACHINE}-linux"
  find "${payload}/cli/vendor/ripgrep" -type f -exec chmod 755 {} +
fi

# Agent harness: the bundled @genie/agent-harness resolves its platform
# package from the application node_modules.
mkdir -p "${WORK_DIR}/harness"
tar -xzf "${HARNESS_TGZ}" -C "${WORK_DIR}/harness"
[ -x "${WORK_DIR}/harness/package/bin/agent-harness" ] || die "unexpected agent-harness layout"
harness_version="$(pkg_version "${WORK_DIR}/harness/package")"
declared_harness="$(node -e '
const pkg = require(process.argv[1] + "/package.json");
const deps = { ...pkg.dependencies, ...pkg.optionalDependencies };
process.stdout.write(deps["@tencent-ai/agent-harness-linux-" + process.argv[2]] || "");
' "${payload}/node_modules/@genie/agent-harness" "${MACHINE}")"
[ "${harness_version}" = "${EXPECTED_HARNESS}" ] ||
  die "agent-harness version drift: pinned ${EXPECTED_HARNESS}, tarball is ${harness_version}"
[ -z "${declared_harness}" ] || [ "${declared_harness}" = "${harness_version}" ] ||
  die "agent-harness version drift: app declares ${declared_harness}, tarball is ${harness_version}"
mkdir -p "${payload}/node_modules/@tencent-ai"
cp -a "${WORK_DIR}/harness/package" \
  "${payload}/node_modules/@tencent-ai/agent-harness-linux-${MACHINE}"
# The harness binary resolves helpers (ripgrep, sandbox shims) relative to its
# own bin directory; make sure they are executable after the copy.
find "${payload}/node_modules/@tencent-ai/agent-harness-linux-${MACHINE}/bin" -type f \
  -exec chmod 755 {} +

# ---------------------------------------------------------------------------
# 6. Drop foreign-platform artifacts
# ---------------------------------------------------------------------------
info "Removing Windows/macOS binaries"
# Native addons compiled only for Windows (WeChat decoder, turing SDK, metrics).
# The official Linux build ships their JS loaders without any binary either.
rm -rf "${payload}"/native/*/build
# The WeChat Pay plugin has no Linux build upstream.
rm -rf "${payload}/resources/plugins/workbuddy-builtin/builtin-plugins/weixinpay/prebuilds"
# Directories that only ever hold foreign binaries or platform sources.
find "${payload}" -depth -type d \( -name 'win32-*' -o -name 'darwin-*' \
  -o -name 'macos-*' -o -name '*-macos' \) -exec rm -rf {} +
find "${app}" -type f \( -name '*.exe' -o -name '*.dll' -o -name '*.sys' \
  -o -name '*.dylib' -o -name '*.pdb' -o -name '*.lib' \) -delete

# Compiled addons that are not ELF, or are ELF for the wrong machine, cannot
# load in this build. The zip also lists sidecars for platforms it never
# shipped, which asar.cjs already skipped.
case "${MACHINE}" in
  x64) elf_machine='x86-64' ;;
  arm64) elf_machine='ARM aarch64' ;;
esac
while IFS= read -r -d '' binary; do
  description="$(file -b "${binary}")"
  case "${description}" in
    ELF*) case "${description}" in *"${elf_machine}"*) ;; *) rm -f "${binary}" ;; esac ;;
    *) rm -f "${binary}" ;;
  esac
done < <(find "${app}" -type f -name '*.node' -print0)

# Platform-specific packages: keep the base package and the target platform.
prune_keep() {
  local parent="$1"
  shift
  [ -d "${parent}" ] || return 0
  local child name keep
  for child in "${parent}"/*; do
    [ -e "${child}" ] || continue
    name="$(basename "${child}")"
    for keep in "$@"; do
      [ "${name}" = "${keep}" ] && continue 2
    done
    rm -rf "${child}"
  done
}
for base in "${payload}" "${payload}/cli"; do
  prune_keep "${base}/node_modules/@lydell" node-pty "node-pty-linux-${MACHINE}"
  if [ -d "${base}/node_modules/koffi/build/koffi" ]; then
    prune_keep "${base}/node_modules/koffi/build/koffi" "${koffi_platform}"
  fi
  prune_keep "${base}/node_modules/@ban-dal" os-bridge "os-bridge-linux-${MACHINE}-gnu"
  rm -rf "${base}/node_modules/node-pty/prebuilds"
done
rm -rf "${payload}/node_modules/@tencent/wwapi-electron"

# ---------------------------------------------------------------------------
# 7. Patch, index, verify metadata
# ---------------------------------------------------------------------------
info "Applying Linux compatibility patch"
node "${SCRIPT_DIR}/patch.cjs" "${payload}"

info "Building the unpacked ASAR index"
node "${SCRIPT_DIR}/asar.cjs" shadow "${payload}" "${resources}/app.asar"

# The session runtimes must match what the app declares for Linux, otherwise
# the daemon tries to download a replacement at first launch.
info "Checking session runtimes"
declared="$(node -e '
const fs = require("node:fs");
const source = fs.readFileSync(process.argv[1], "utf8");
const pick = (name) => {
  const match = source.match(new RegExp("\\{name:`" + name + "`[^}]*?version:`([^`]+)`[^}]*?platforms:\\[`linux`\\]"));
  return match ? match[1] : "";
};
process.stdout.write(`${pick("node")} ${pick("python")}`);
' "${payload}/main/shell-env-async.js")"
read -r need_node need_python <<<"${declared}"
[ -n "${need_node}" ] && [ -n "${need_python}" ] ||
  die "could not read the declared Linux runtime versions"
have_node="$("${resources}/runtime/node/bin/node" --version)"
have_node="${have_node#v}"
[ "${have_node}" = "${need_node}" ] ||
  die "runtime mismatch: app wants node ${need_node}, donor ships ${have_node}"
have_python="$("${resources}/runtime/python/bin/python3" --version 2>&1 | awk '{print $2}')"
[ "${have_python}" = "${need_python}" ] ||
  die "runtime mismatch: app wants python ${need_python}, donor ships ${have_python}"
chmod 755 "${app}/workbuddy"
printf '    node %s, python %s\n' "${have_node}" "${have_python}"

cp -a "${app}" "${OUT_DIR}"
