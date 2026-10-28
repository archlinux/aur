#!/usr/bin/env bash
set -euo pipefail

# Detect Termux / Android environment
PREFIX="${PREFIX:-/usr}"
if [[ -n "${TERMUX_VERSION:-}" || -d "/data/data/com.termux" ]]; then
  export SSL_CERT_FILE="${SSL_CERT_FILE:-/data/data/com.termux/files/usr/etc/tls/cert.pem}"
  export SSL_CERT_DIR="${SSL_CERT_DIR:-/data/data/com.termux/files/usr/etc/tls/certs}"
  export TMPDIR="${TMPDIR:-/data/data/com.termux/files/usr/tmp}"
fi

REAL_BIN="${PREFIX}/lib/muse/muse"
if [[ ! -x "${REAL_BIN}" ]]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  if [[ -x "${SCRIPT_DIR}/../lib/muse/muse" ]]; then
    REAL_BIN="${SCRIPT_DIR}/../lib/muse/muse"
  elif [[ -x "${SCRIPT_DIR}/muse" ]]; then
    REAL_BIN="${SCRIPT_DIR}/muse"
  fi
fi

# Handle session/mcp management extensions
if [[ "${1:-}" == "session" || "${1:-}" == "sessions" ]]; then
  shift
  SESSION_HELPER="${PREFIX}/lib/muse/muse-session"
  if [[ ! -x "${SESSION_HELPER}" ]]; then
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    if [[ -x "${SCRIPT_DIR}/../lib/muse/muse-session" ]]; then
      SESSION_HELPER="${SCRIPT_DIR}/../lib/muse/muse-session"
    elif [[ -x "${SCRIPT_DIR}/muse-session" ]]; then
      SESSION_HELPER="${SCRIPT_DIR}/muse-session"
    fi
  fi
  exec "${SESSION_HELPER}" "$@"
fi

if [[ "${1:-}" == "mcp" ]]; then
  # Only our helper subcommands are intercepted; anything else (e.g. the
  # native `mcp login/logout` for OAuth) falls through to the real binary
  # below, preserving "$@" (including the leading "mcp").
  case "${2:-}" in
    ""|list|status|import|add|enable|disable|remove|check|export|help)
      shift
      MCP_HELPER="${PREFIX}/lib/muse/muse-mcp"
      if [[ ! -x "${MCP_HELPER}" ]]; then
        SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
        if [[ -x "${SCRIPT_DIR}/../lib/muse/muse-mcp" ]]; then
          MCP_HELPER="${SCRIPT_DIR}/../lib/muse/muse-mcp"
        elif [[ -x "${SCRIPT_DIR}/muse-mcp" ]]; then
          MCP_HELPER="${SCRIPT_DIR}/muse-mcp"
        fi
      fi
      exec "${MCP_HELPER}" "$@"
      ;;
  esac
fi

if [[ "${1:-}" == "stats" ]]; then
  # No native `stats` subcommand exists; intercept only our helper's own
  # flags and pass anything else through, so a future native `stats`
  # keeps working by default.
  case "${2:-}" in
    ""|--json|--since|--since=*|--top|--top=*|--days|--days=*|--no-allowance|-h|--help)
      shift
      STATS_HELPER="${PREFIX}/lib/muse/muse-stats"
      if [[ ! -x "${STATS_HELPER}" ]]; then
        SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
        if [[ -x "${SCRIPT_DIR}/../lib/muse/muse-stats" ]]; then
          STATS_HELPER="${SCRIPT_DIR}/../lib/muse/muse-stats"
        elif [[ -x "${SCRIPT_DIR}/muse-stats" ]]; then
          STATS_HELPER="${SCRIPT_DIR}/muse-stats"
        fi
      fi
      exec "${STATS_HELPER}" "$@"
      ;;
  esac
fi

# On Termux / Android, static Linux binaries (musl) trigger SIGSYS (signal 31)
# due to Android zygote seccomp blocking newer syscalls (such as openat2).
# We run under proot to virtualize syscalls and provide a standard Linux VFS hierarchy.
if [[ -n "${TERMUX_VERSION:-}" || -d "/data/data/com.termux" ]]; then
  if [[ -z "${PROOT_ACTIVE:-}" ]] && ! grep -q 'TracerPid:[[:space:]]*[1-9]' /proc/self/status 2>/dev/null; then
    if ! command -v proot >/dev/null 2>&1; then
      printf 'Error: proot is required to run Muse Code on Android/Termux.\n' >&2
      printf 'Please install it with: pkg install proot\n' >&2
      exit 1
    fi

    PROOT_ARGS=("--kill-on-exit")
    PROOT_ARGS+=("-b" "/system:/system" "-b" "/vendor:/vendor" "-b" "/data:/data")
    [[ -d /apex ]] && PROOT_ARGS+=("-b" "/apex:/apex")
    [[ -e /linkerconfig/ld.config.txt ]] && PROOT_ARGS+=("-b" "/linkerconfig/ld.config.txt:/linkerconfig/ld.config.txt")
    [[ -f /property_contexts ]] && PROOT_ARGS+=("-b" "/property_contexts:/property_contexts")
    [[ -d /storage ]] && PROOT_ARGS+=("-b" "/storage:/storage")
    [[ -d /sbin && -d /root ]] && PROOT_ARGS+=("-b" "/sbin:/sbin" "-b" "/root:/root")

    PROOT_ARGS+=("-b" "${PREFIX}:/usr")
    for d in bin etc lib share tmp var; do
      [[ -d "${PREFIX}/${d}" ]] && PROOT_ARGS+=("-b" "${PREFIX}/${d}:/${d}")
    done
    for d in dev proc; do
      [[ -d "/${d}" ]] && PROOT_ARGS+=("-b" "/${d}:/${d}")
    done

    # Canonicalize the proot root and map the current directory into the
    # guest VFS: a raw --cwd=. leaks the host path (e.g. Termux's
    # /data/data/... prefix) into the guest, which breaks workspace trust
    # resolution ("target changed during startup"). Bind the invoking $HOME
    # to /home while at it, since HOME is /home inside the guest.
    PROOT_ROOT="$(cd "${PREFIX}/.." && pwd)"
    PROOT_ARGS+=("-r" "${PROOT_ROOT}")
    PROOT_ARGS+=("-b" "${HOME}:/home")
    PROOT_CWD="${PWD#${PROOT_ROOT}}"
    PROOT_ARGS+=("--cwd=${PROOT_CWD:-/home}")

    export PROOT_ACTIVE=1
    export HOME="/home"
    exec proot "${PROOT_ARGS[@]}" "$REAL_BIN" "$@"
  fi
fi

# Recent upstream binaries run natively on pre-AVX2 CPUs, so native
# execution is the default. AVX2 emulation under qemu-x86_64 is strictly
# opt-in: set MUSE_QEMU=1 in the environment or pass --qemu as the first
# argument to route execution through qemu-x86_64 -cpu max.
USE_QEMU="${MUSE_QEMU:-0}"
if [[ "${1:-}" == "--qemu" ]]; then
  USE_QEMU=1
  shift
fi

if [[ "${USE_QEMU}" == "1" ]]; then
  if command -v qemu-x86_64 >/dev/null 2>&1; then
    exec qemu-x86_64 -cpu max "$REAL_BIN" "$@"
  else
    printf 'Error: QEMU emulation was requested (MUSE_QEMU=1 / --qemu) but qemu-x86_64 was not found.\n' >&2
    printf 'Install it with: sudo pacman -S qemu-user\n' >&2
    exit 1
  fi
fi

exec "$REAL_BIN" "$@"
