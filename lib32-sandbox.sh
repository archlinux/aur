#!/bin/bash
# Runs a command (default: steam) as if only the lib32 packages in $LIB32_KEEP
# (default lib32-glibc; empty for none) were installed, without uninstalling any.
set -euo pipefail
args=(--dev-bind / / --tmpfs /usr/lib32)
keep=${LIB32_KEEP-lib32-glibc}
[ -z "$keep" ] || while read -r f; do
  args+=(--ro-bind "$f" "$f")
done < <(pacman -Qlq $keep | grep '^/usr/lib32/.*[^/]$')
[ $# -gt 0 ] || set -- steam
exec bwrap "${args[@]}" "$@"
