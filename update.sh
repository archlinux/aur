#!/usr/bin/env bash
# update.sh — self-contained update/build automation for plasticity-4arch.
#
# Does all the heavy lifting in its own directory: resolves the version,
# downloads the official .deb + LICENSE into this dir (makepkg's source dir,
# so makepkg reuses the files), checksums both, runs a layout CANARY (fails
# loudly if upstream moved libA3DLIBS.so / the kernel modules), renders
# PKGBUILD from PKGBUILD.template with real checksums, and — unless
# --no-build — runs makepkg and proves the built artifact carries the loader
# fix (RPATH=$ORIGIN on pk.node et al.) without installing it.
#
# Usage: ./update.sh [--version X] [--force] [--no-build] [--test] [--install] [--help]
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

REPO="nkallen/plasticity"
PKGNAME="plasticity-4arch"

VER=""
FORCE=0
NO_BUILD=0
TEST=0
INSTALL=0

usage() {
  cat <<'EOF'
Usage: ./update.sh [OPTIONS]

  --version X   pin version X instead of querying the GitHub API for latest
  --force       rebuild even if PKGBUILD is already at the target version
                (also forces re-download of the .deb / LICENSE)
  --no-build    fetch + checksum + canary + render PKGBUILD, skip makepkg
  --test        after build, print the install+verify procedure; combined
                with --install, actually install + verify (passwordless sudo
                and a reachable user session required, else commands are
                just printed)
  --install     only valid together with --test
  --help, -h    show this help
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --version)   VER="${2:-}"; shift 2 ;;
    --version=*) VER="${1#*=}"; shift ;;
    --force)     FORCE=1; shift ;;
    --no-build)  NO_BUILD=1; shift ;;
    --test)      TEST=1; shift ;;
    --install)   INSTALL=1; shift ;;
    --help|-h)   usage; exit 0 ;;
    *) echo "ERROR: unknown argument: $1" >&2; usage >&2; exit 1 ;;
  esac
done
if [[ "$INSTALL" -eq 1 && "$TEST" -eq 0 ]]; then
  echo "ERROR: --install only makes sense together with --test" >&2
  exit 1
fi
if [[ -n "$VER" && ! "$VER" =~ ^[0-9]+(\.[0-9]+)*$ ]]; then
  echo "ERROR: invalid --version value: $VER" >&2
  exit 1
fi

# ---------------------------------------------------------------------------
# a) Resolve target version.
# ---------------------------------------------------------------------------
if [[ -z "$VER" ]]; then
  echo "[resolve] querying GitHub for latest release …"
  local_json=""
  if ! local_json="$(curl -fsSL "https://api.github.com/repos/${REPO}/releases/latest")"; then
    echo "ERROR: could not query the GitHub releases API (network blocked or rate-limited)." >&2
    echo "       hint: re-run with an explicit pin, e.g.  ./update.sh --version 26.1.4" >&2
    exit 1
  fi
  if command -v jq >/dev/null 2>&1; then
    VER="$(printf '%s' "$local_json" | jq -r '.tag_name // empty')"
  else
    VER="$(printf '%s' "$local_json" | grep -o '"tag_name"[[:space:]]*:[[:space:]]*"[^"]*"' | head -n1 | sed 's/.*:[[:space:]]*"//; s/"$//')"
  fi
  VER="${VER#v}"
  if [[ -z "$VER" || "$VER" == "null" ]]; then
    echo "ERROR: could not parse tag_name from the API response." >&2
    exit 1
  fi
fi
echo "[resolve] target version: ${VER}"

# ---------------------------------------------------------------------------
# b) Idempotence: no-op if PKGBUILD is already at the target version.
# ---------------------------------------------------------------------------
CURRENT=""
if [[ -f PKGBUILD ]]; then
  CURRENT="$(grep -m1 '^pkgver=' PKGBUILD | cut -d= -f2 | tr -d ' "' || true)"
fi
if [[ -n "$CURRENT" && "$CURRENT" == "$VER" && "$FORCE" -eq 0 ]]; then
  echo "already at v${VER} — use --force to rebuild"
  exit 0
fi
if [[ -n "$CURRENT" && "$CURRENT" != "$VER" ]]; then
  echo "[idempotence] PKGBUILD at v${CURRENT}, target v${VER}"
fi

# ---------------------------------------------------------------------------
# c) Download inputs into this directory (makepkg source dir → reused, no
#    re-download by makepkg).
# ---------------------------------------------------------------------------
DEB_FILE="plasticity_${VER}_amd64.deb"
LIC_FILE="LICENSE"

download_if_needed() {
  local file="$1" url="$2"
  if [[ -f "$file" && "$FORCE" -eq 0 ]]; then
    echo "[fetch] ${file} already present — skipping download (use --force to re-download)"
    return 0
  fi
  echo "[fetch] ${url}"
  curl -fSL --retry 3 -o "$file" "$url"
}
echo "[fetch] downloading inputs (if not already present) …"
download_if_needed "$DEB_FILE" "https://github.com/${REPO}/releases/download/v${VER}/${DEB_FILE}"
download_if_needed "$LIC_FILE" "https://raw.githubusercontent.com/${REPO}/refs/tags/v${VER}/LICENSE"

# ---------------------------------------------------------------------------
# d) Checksums.
# ---------------------------------------------------------------------------
echo "[checksum] computing sha512 …"
DEB_SHA="$(sha512sum "$DEB_FILE" | awk '{print $1}')"
LIC_SHA="$(sha512sum "$LIC_FILE" | awk '{print $1}')"
echo "  ${DEB_FILE}: ${DEB_SHA}"
echo "  ${LIC_FILE}: ${LIC_SHA}"

# ---------------------------------------------------------------------------
# e) CANARY — fail loudly if upstream layout changed.
# ---------------------------------------------------------------------------
echo "[canary] extracting data payload in a scratch dir …"
CANARY_TMP="$(mktemp -d)"
trap 'rm -rf "$CANARY_TMP"' EXIT
cp "$DEB_FILE" "$CANARY_TMP/"
# tar -xf (no compression flag): GNU tar auto-detects the zstd magic of the
# named file. Deliberately NOT -J — some local tar builds have broken -J/zstd
# wiring (verified on this box: -J routes to xz and fails).
if ! ( cd "$CANARY_TMP" && ar x "$DEB_FILE" && mkdir payload && tar -xf data.tar.zst -C payload ); then
  echo "ERROR: could not extract the .deb data payload (ar/tar failed) — inspect the .deb manually." >&2
  exit 1
fi

CANARY_LIB="$(find "$CANARY_TMP/payload" -type f -name libA3DLIBS.so -print -quit)"
if [[ -z "$CANARY_LIB" ]]; then
  echo "ERROR: upstream layout changed — libA3DLIBS.so not found in the data payload. Inspect before packaging." >&2
  exit 1
fi
CANARY_NODES="$(find "$CANARY_TMP/payload" -type f -name '*.node')"
if [[ -z "$CANARY_NODES" ]]; then
  echo "ERROR: upstream layout changed — no .node modules found in the data payload. Inspect before packaging." >&2
  exit 1
fi
CANARY_LIBDIR="$(dirname "$CANARY_LIB")"
echo "  libA3DLIBS.so: ${CANARY_LIB#"$CANARY_TMP/payload"/} (payload-relative)"

echo "  future patch targets (modules in ${CANARY_LIBDIR#"$CANARY_TMP/payload"/} referencing libA3DLIBS):"
TARGETS=()
for f in "$CANARY_LIBDIR"/*.node "$CANARY_LIBDIR"/*.so; do
  [[ -f "$f" ]] || continue
  n="$(strings -a "$f" 2>/dev/null | grep -c libA3DLIBS || true)"
  if [[ "${n:-0}" -gt 0 ]]; then
    TARGETS+=("$(basename "$f")")
    echo "    - $(basename "$f")"
  fi
done
if [[ "${#TARGETS[@]}" -eq 0 ]]; then
  echo "  (none string-referenced the lib; apply-loader-fix.sh will use its pk.node fallback)"
fi
rm -rf "$CANARY_TMP"
trap - EXIT

# ---------------------------------------------------------------------------
# f) Render PKGBUILD from the template with real values.
# ---------------------------------------------------------------------------
echo "[render] PKGBUILD.template → PKGBUILD"
sed -e "s/@PKGVER@/${VER}/g" \
    -e "s/@SHA512_DEB@/${DEB_SHA}/g" \
    -e "s/@SHA512_LICENSE@/${LIC_SHA}/g" \
    PKGBUILD.template > PKGBUILD
echo "  pkgver=${VER}"

# ---------------------------------------------------------------------------
# g) Build (unless --no-build).
# ---------------------------------------------------------------------------
PKG_ARTIFACT=""
PKGREL="$(grep -m1 '^pkgrel=' PKGBUILD | cut -d= -f2 | tr -d ' "' || true)"
if [[ "$NO_BUILD" -eq 1 ]]; then
  echo "[build] skipped (--no-build)"
else
  if ! command -v makepkg >/dev/null 2>&1; then
    echo "ERROR: makepkg missing — install base-devel first:  sudo pacman -S base-devel" >&2
    exit 1
  fi
  if ! command -v patchelf >/dev/null 2>&1; then
    echo "ERROR: patchelf missing — the loader fix cannot be applied. Install first:  sudo pacman -S patchelf" >&2
    exit 1
  fi
  echo "[build] makepkg -fC --skippgpcheck …"
  BUILD_LOG="$(mktemp "${TMPDIR:-/tmp}/plasticity-4arch-build.XXXXXX.log")"
  if ! makepkg -fC --skippgpcheck >"$BUILD_LOG" 2>&1; then
    echo "ERROR: makepkg failed. Last 40 lines (full log: ${BUILD_LOG}):" >&2
    tail -n 40 "$BUILD_LOG" >&2
    exit 1
  fi
  PKG_ARTIFACT="${SCRIPT_DIR}/${PKGNAME}-${VER}-${PKGREL:--x86_64}-x86_64.pkg.tar.zst"
  if [[ ! -f "$PKG_ARTIFACT" ]]; then
    echo "ERROR: expected build artifact not found: ${PKG_ARTIFACT}" >&2
    exit 1
  fi
  echo "[build] artifact: ${PKG_ARTIFACT##*/}"
fi

# ---------------------------------------------------------------------------
# h) Artifact proof: the built package carries the fix (no install needed).
# ---------------------------------------------------------------------------
if [[ -n "$PKG_ARTIFACT" ]]; then
  echo "[proof] extracting ${PKG_ARTIFACT##*/} and checking RPATH …"
  PROOF_TMP="$(mktemp -d)"
  tar -xf "$PKG_ARTIFACT" -C "$PROOF_TMP"   # auto-detect zstd (see canary note)
  PROOF_LIB="$(find "$PROOF_TMP" -type f -name libA3DLIBS.so -print -quit)"
  if [[ -z "$PROOF_LIB" ]]; then
    echo "ERROR: artifact proof failed — libA3DLIBS.so missing from the built package." >&2
    rm -rf "$PROOF_TMP"
    exit 1
  fi
  PROOF_LIBDIR="$(dirname "$PROOF_LIB")"
  PROOF_OK=0
  for f in "$PROOF_LIBDIR"/*.node "$PROOF_LIBDIR"/*.so; do
    [[ -f "$f" ]] || continue
    r="$(patchelf --print-rpath "$f" 2>/dev/null || true)"
    rel="${f#"$PROOF_TMP"/}"
    if [[ "$r" == *\$ORIGIN* ]]; then   # literal $ORIGIN match (SC2016: escape, not quotes)
      echo "  OK   ${rel}  RPATH=${r}"
      PROOF_OK=1
    else
      echo "  MISS ${rel}  RPATH=${r:-<none>}"
    fi
  done
  if [[ -f "$PROOF_LIBDIR/pk.node" ]]; then
    r="$(patchelf --print-rpath "$PROOF_LIBDIR/pk.node")"
    if [[ "$r" != *\$ORIGIN* ]]; then   # literal $ORIGIN match (SC2016: escape, not quotes)
      echo "ERROR: artifact proof failed — pk.node RPATH is '${r:-<none>}', expected \$ORIGIN." >&2
      rm -rf "$PROOF_TMP"
      exit 1
    fi
  fi
  if [[ "$PROOF_OK" -ne 1 ]]; then
    echo "ERROR: artifact proof failed — no module in the built package carries RPATH=\$ORIGIN." >&2
    rm -rf "$PROOF_TMP"
    exit 1
  fi
  rm -rf "$PROOF_TMP"
  echo "[proof] OK — the built package carries the loader fix."
fi

# ---------------------------------------------------------------------------
# i) --test: verification procedure (and optional real install+verify).
# ---------------------------------------------------------------------------
PARENT_DIR="$(dirname "$SCRIPT_DIR")"
if [[ "$TEST" -eq 1 ]]; then
  echo
  echo "=== verification procedure ==="
  if [[ -n "$PKG_ARTIFACT" ]]; then
    echo "1) install the built package:"
    echo "     sudo pacman -U \"${PKG_ARTIFACT}\""
  else
    echo "1) build first (./update.sh), then install:"
    echo "     sudo pacman -U ${PKGNAME}-${VER}-${PKGREL:--x86_64}-x86_64.pkg.tar.zst"
  fi
  echo "2) verify a bare launch (systemd-run --user + log assertion + clean stop):"
  echo "     cd \"${PARENT_DIR}\" && ./plasticity-fix.sh --verify"
  echo "3) optional cleanup:  rm -f \"${SCRIPT_DIR}\"/*.pkg.tar.zst"
  if [[ "$INSTALL" -eq 1 ]]; then
    if [[ -z "${DBUS_SESSION_BUS_ADDRESS:-}" ]]; then
      echo "note: no DBUS_SESSION_BUS_ADDRESS in this environment — printing commands only."
      echo "      re-run './update.sh --test --install' from a graphical user session."
    elif ! sudo -n true 2>/dev/null; then
      echo "note: passwordless sudo not available — refusing to sudo; printing commands only:"
      echo "     sudo pacman -U \"${PKG_ARTIFACT}\""
      echo "     cd \"${PARENT_DIR}\" && ./plasticity-fix.sh --verify"
    else
      echo "performing passwordless install + verify …"
      sudo -n pacman -U "$PKG_ARTIFACT"
      ( cd "$PARENT_DIR" && ./plasticity-fix.sh --verify )
    fi
  fi
fi

# ---------------------------------------------------------------------------
# j) Summary.
# ---------------------------------------------------------------------------
echo
echo "=== SUMMARY ==="
echo "version:       v${VER}"
echo "checksums:     deb=${DEB_SHA}"
echo "               lic=${LIC_SHA}"
echo "files:         PKGBUILD rendered (pkgver=${VER}, pkgrel=${PKGREL:-1}); inputs: ${DEB_FILE}, ${LIC_FILE}"
if [[ -n "$PKG_ARTIFACT" ]]; then
  echo "artifact:      ${PKG_ARTIFACT##*/}"
fi
echo "patch targets: ${TARGETS[*]:-<fallback only: pk.node>}"
echo "next steps:"
echo "  1) sudo pacman -U ${PKG_ARTIFACT:-${PKGNAME}-${VER}-${PKGREL:--x86_64}-x86_64.pkg.tar.zst}"
echo "  2) cd \"${PARENT_DIR}\" && ./plasticity-fix.sh --verify"
echo "  3) git add aur/ && git commit — then AUR submit ('plasticity-4arch' name confirmed available 2026-08-26, see BUILD-LOG)"
echo "reminder: the loader fix lives in apply-loader-fix.sh (sourced by package())."
