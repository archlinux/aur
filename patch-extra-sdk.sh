#!/bin/bash
# Patch hvigor and the IDE's project-sync check so a project can use an
# SDK other than the bundled 26.0.0 one (e.g. 6.1.1 Release). Both are
# hardwired to the bundled SDK version:
#
#   1. hvigor validate-util.js  — rejects any compileSdkVersion that is not
#      exactly SUPPORT_COMPILE_VERSION ("26.0.0") (UNSUPPORTED_COMPILESDKVERSION)
#   2. hvigor hmos-sdk-loader.js — hvigor 6.26.4+ adds COMPILE_SDK_VERSION_MISMATCH
#      (00303313) for a compileSdkVersion whose API differs from the latest
#      supported one
#   3. IDE hos-project-mgmt-*.jar — HosIntegrationChecker aborts project sync
#      unless compileSdkVersion equals the embedded SDK
#
# Package upgrades restore the pristine hvigor/IDE files, so these must be
# re-applied afterwards; devecostudio.install does that automatically.
#
# Idempotent. Needs root to write into /opt (re-execs itself under sudo).
#
# Usage: patch-extra-sdk.sh [--auto]
#   --auto   no-op unless an additional SDK is actually installed under
#            /opt/devecostudio/sdk/ (used by the pacman post_install /
#            post_upgrade hook, which must stay silent on a normal install)
set -euo pipefail

IDEDIR=/opt/devecostudio
SDKDIR="$IDEDIR/sdk"

if [[ "${1:-}" == "--auto" ]]; then
  # An extra SDK is a directory other than "default" that carries both
  # sdk-pkg.json and an openharmony/ tree — that skips unrelated leftovers
  # such as the metadata-only backups we leave behind during debugging.
  shopt -s nullglob
  _found=""
  for d in "$SDKDIR"/*/; do
    [[ "$(basename "$d")" == default ]] && continue
    if [[ -f "$d/sdk-pkg.json" && -d "$d/openharmony" ]]; then
      _found="$(basename "$d")"
      break
    fi
  done
  if [[ -z "$_found" ]]; then
    exit 0
  fi
  echo "Extra SDK detected ($_found) — re-applying hvigor/IDE patches"
fi

if [[ "$(id -u)" -ne 0 ]]; then
  exec sudo -- "$(readlink -f "$0")" "$@"
fi

# Prefer the interpreter shipped inside the package: python3 is only a
# makedepends (a build-time requirement), and .install hooks run in a
# minimal environment where python3 may not even be on PATH.
PY="$IDEDIR/plugins/app-analyzer/lib/python/bin/python3.12"
if [[ ! -x "$PY" ]]; then
  PY="$(command -v python3 || true)"
fi
if [[ -z "${PY:-}" ]]; then
  echo "No python interpreter available (looked for the bundled 3.12 and python3)" >&2
  exit 1
fi

"$PY" - << 'PYEOF'
import glob, os, shutil, zipfile

IDEDIR = "/opt/devecostudio"


def patch_text(path, old, new, label):
    """Idempotent single-occurrence textual patch."""
    if not os.path.exists(path):
        print(f"  {label}: not found ({path})")
        return
    s = open(path).read()
    if old in s:
        open(path, "w").write(s.replace(old, new))
        print(f"  {label}: patched")
    elif new in s:
        print(f"  {label}: already patched")
    else:
        print(f"  {label}: pattern not found — upstream layout changed?")


# 1) hvigor validate-util.js: neutralize UNSUPPORTED_COMPILESDKVERSION
patch_text(
    f"{IDEDIR}/tools/hvigor/hvigor-ohos-plugin/src/utils/validate/validate-util.js",
    '(0,sdkmanager_common_1.isEqualApiVersion)(r,s)&&0===(0,sdkmanager_common_1.compareVersion)(t.api,n.api)'
    '||this._log.printErrorExit("UNSUPPORTED_COMPILESDKVERSION",[i.compileSdkVersion,o],'
    '[[version_const_js_1.VersionConst.SUPPORT_COMPILE_VERSION]])',
    '(0,sdkmanager_common_1.isEqualApiVersion)(r,s)&&0===(0,sdkmanager_common_1.compareVersion)(t.api,n.api)||void 0',
    "hvigor compileSdkVersion check",
)

# 2) hvigor hmos-sdk-loader.js: neutralize COMPILE_SDK_VERSION_MISMATCH (00303313)
patch_text(
    f"{IDEDIR}/tools/hvigor/hvigor-ohos-plugin/src/sdk/hmos-sdk-loader.js",
    'o.fullVersion!==e&&_log.printErrorExit("COMPILE_SDK_VERSION_MISMATCH",[o.fullVersion,e])',
    'o.fullVersion!==e||void 0',
    "hvigor sdk-loader check",
)

# 3) IDE project sync: HosIntegrationChecker.checkSameCompileSdkIfConfig
#    Flip the ifne after StringUtil.equals() to an unconditional goto, so the
#    check always passes and notifyCompileSdkErrorMessage never runs.
INNER = "com/huawei/deveco/projectmgmt/hos/sync/integration/HosIntegrationChecker.class"
OLD = b"\xb8\x00\xad\x9a\x00\x0b"  # invokestatic StringUtil.equals + ifne
NEW = b"\xb8\x00\xad\xa7\x00\x0b"  # invokestatic StringUtil.equals + goto

for jar in sorted(glob.glob(f"{IDEDIR}/plugins/harmony/lib/hos-project-mgmt-*.jar")):
    name = os.path.basename(jar)
    with zipfile.ZipFile(jar) as zin:
        try:
            data = zin.read(INNER)
        except KeyError:
            print(f"  IDE sync ({name}): {INNER} missing — skipped")
            continue
        if data.count(NEW) == 1:
            print(f"  IDE sync ({name}): already patched")
            continue
        if data.count(OLD) != 1:
            print(f"  IDE sync ({name}): byte pattern not unique — skipped")
            continue
        tmp = jar + ".tmp"
        with zipfile.ZipFile(jar) as zin2, zipfile.ZipFile(tmp, "w", zipfile.ZIP_DEFLATED) as zout:
            for item in zin2.infolist():
                blob = zin2.read(item.filename)
                if item.filename == INNER:
                    blob = blob.replace(OLD, NEW)
                zout.writestr(item, blob)
        shutil.move(tmp, jar)
        print(f"  IDE sync ({name}): patched")
PYEOF

echo "Done: hvigor and IDE project sync now accept any compileSdkVersion."
