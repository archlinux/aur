#!/usr/bin/env bash

set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
temp="$(mktemp -d)"
trap 'rm -rf "$temp"' EXIT

cat > "$temp/application" <<'EOF'
#!/bin/sh
printf 'platform=%s\n' "$QT_QPA_PLATFORMTHEME"
printf 'arguments=%s\n' "$*"
EOF
chmod +x "$temp/application"

cat > "$temp/darkman" <<'EOF'
#!/bin/sh
printf '%s\n' dark
EOF
chmod +x "$temp/darkman"

output="$(PATH="$temp:$PATH" QT_SOLARIZED_DIR="$root" \
    "$root/qt-solarized" "$temp/application" document.pdf)"
grep -Fxq 'platform=gtk3' <<< "$output"
grep -Fq "solarized-dark.qss document.pdf" <<< "$output"

output="$(QT_SOLARIZED_DIR="$root" \
    "$root/qt-solarized" --light "$temp/application" document.pdf)"
grep -Fq "solarized-light.qss document.pdf" <<< "$output"

if QT_SOLARIZED_DIR="$root" QT_SOLARIZED_THEME=invalid \
        "$root/qt-solarized" "$temp/application" >/dev/null 2>&1; then
    printf 'invalid theme was accepted\n' >&2
    exit 1
fi

printf 'qt-solarized tests passed\n'
