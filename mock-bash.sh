#!/usr/bin/bash
set -euo pipefail
printf '%s\0' "$@" "$WINEPREFIX" "${WINRTCAMSTUB_DLL:-}" "${LIGHTBURN_LAUNCHER_EXE:-}" > "$TRACE"
exit "$MOCK_STATUS"
