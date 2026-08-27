#!/usr/bin/env bash
# apply-loader-fix.sh — build-time loader fix for plasticity-4arch.
#
# Root cause (verified): the official .deb ships pk.node (Plasticity Kernel,
# Parasolid-based) with NO RPATH and NO DT_NEEDED for libA3DLIBS.so; it
# dlopen()s that 176 MB library by BARE NAME. The lib ships colocated with
# pk.node under .../resources/app/.webpack/renderer/. On Arch the dlopen fails
# → SIGABRT after license activation → a windowless main process holds
# Electron's single-instance lock → every later launch exits "MAIN: Lock taken".
#
# Fix: set RPATH=$ORIGIN on every kernel module in the lib's directory that
# actually references libA3DLIBS, at BUILD TIME in package(). $ORIGIN is
# install-prefix-independent (lib and caller are colocated) and works for
# every launcher (Plasma icon, terminal, systemd) — unlike .desktop
# Environment=, which Plasma ignores.
#
# Usage:
#   sourced from PKGBUILD package():  apply_loader_fix "$pkgdir"
#   standalone (testing):             ./apply-loader-fix.sh <payload-root> [--with-ld-fragment]
#
# Sourcing contract: this file only DEFINES apply_loader_fix(); it performs no
# side effects at source time, and its tail guard keeps sourcing safe under
# `set -euo pipefail`.
# shellcheck shell=bash disable=SC2034,SC2317  # SC2317: dual-mode tail guard below — sourced: `return` stops; direct exec: `return` errors, `|| true` continues to the entry point

apply_loader_fix() {
  local root="${1:-}"
  local with_ld_fragment=0
  shift || true

  local arg
  for arg in "$@"; do
    case "$arg" in
      --with-ld-fragment) with_ld_fragment=1 ;;
      *)
        echo "ERROR: apply_loader_fix: unknown option: $arg" >&2
        return 1
        ;;
    esac
  done

  if [[ -z "$root" || ! -d "$root" ]]; then
    echo "ERROR: apply_loader_fix: payload root directory required (got: '${root:-}')" >&2
    return 1
  fi

  # 1) Locate the Parasolid lib. LOUD failure if upstream layout changed.
  local lib_file
  lib_file="$(find "$root" -type f -name libA3DLIBS.so -print -quit)"
  if [[ -z "$lib_file" ]]; then
    echo "ERROR: libA3DLIBS.so not found under $root — upstream layout changed; aborting." >&2
    return 1
  fi
  local libdir
  libdir="$(dirname "$lib_file")"
  echo "loader-fix: lib at ${libdir#"$root"/} (payload-relative)"

  # 2) Patch candidates: every regular *.node / *.so in the lib's directory
  #    that actually references the bare dlopen target. grep -c reads all of
  #    stdin (no early-exit SIGPIPE) so this is pipefail-safe.
  local -a patched=()
  local f n
  for f in "$libdir"/*.node "$libdir"/*.so; do
    [[ -f "$f" ]] || continue
    n="$(strings -a "$f" 2>/dev/null | grep -c libA3DLIBS || true)"
    if [[ "${n:-0}" -gt 0 ]]; then
      echo "loader-fix: patching ${f#"$root"/} (references libA3DLIBS, ${n} occurrence(s))"
      patchelf --set-rpath \$ORIGIN "$f"   # literal $ORIGIN (SC2016: escape, not quotes)
      patched+=("$f")
    fi
  done

  # 3) Fallback: nothing referenced the lib but pk.node exists → patch it.
  local count=${#patched[@]}
  if [[ "$count" -eq 0 ]]; then
    if [[ -f "$libdir/pk.node" ]]; then
      echo "loader-fix: no module string-referenced libA3DLIBS; FALLBACK patching ${libdir#/}/pk.node"
      patchelf --set-rpath \$ORIGIN "$libdir/pk.node"   # literal $ORIGIN (SC2016: escape, not quotes)
      patched+=("$libdir/pk.node")
    else
      echo "ERROR: no kernel module referencing libA3DLIBS found in $libdir (and no pk.node fallback) — aborting." >&2
      return 1
    fi
  fi

  # 4) Verify pass: every patched file must report $ORIGIN.
  local r
  for f in "${patched[@]}"; do
    r="$(patchelf --print-rpath "$f")"
    if [[ "$r" != *\$ORIGIN* ]]; then   # literal $ORIGIN match (SC2016: escape, not quotes)
      echo "ERROR: rpath verification FAILED for ${f#"$root"/} (got: '${r:-<none>}')" >&2
      return 1
    fi
    echo "loader-fix: verified RPATH=$r on ${f#"$root"/}"
  done

  # 5) Optional ld.so fragment (OFF by default; kept for future use).
  if [[ "$with_ld_fragment" -eq 1 ]]; then
    local installed_path
    installed_path="/${libdir#"$root"/}"
    mkdir -p "$root/etc/ld.so.conf.d"
    echo "$installed_path" > "$root/etc/ld.so.conf.d/plasticity-4arch.conf"
    echo "loader-fix: wrote ld fragment ${installed_path} → etc/ld.so.conf.d/plasticity-4arch.conf"
  fi

  echo "loader-fix: done — ${#patched[@]} module(s) carry RPATH=\$ORIGIN"
  return 0
}

# Tail guard: makes `source apply-loader-fix.sh` safe under `set -e` in a
# PKGBUILD (the bare `return` at script scope is a no-op error when executed
# directly, and `|| true` keeps the status 0 either way).
return 0 2>/dev/null || true

# Standalone entry point for testing.
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  apply_loader_fix "$@"
fi
