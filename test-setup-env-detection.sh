#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT

shipped_env="$TEMP_DIR/shipped.env"
real_env="$TEMP_DIR/real.env"

cp "$SCRIPT_DIR/lab-safety-system.env" "$shipped_env"
cat > "$real_env" <<'EOF'
APP_ENV=production
DATABASE_URL=postgresql://lab_safety:real-password@127.0.0.1:5432/lab_safety
SECRET_KEY=0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
EOF

LAB_SAFETY_SETUP_TEST_ENV_CHECK=1 "$SCRIPT_DIR/lab-safety-system-setup" "$shipped_env"

if LAB_SAFETY_SETUP_TEST_ENV_CHECK=1 "$SCRIPT_DIR/lab-safety-system-setup" "$real_env"; then
  echo "real environment was incorrectly classified as a template" >&2
  exit 1
fi

grep -Fqx 'DATABASE_URL=postgresql://lab_safety:real-password@127.0.0.1:5432/lab_safety' "$real_env"
grep -Fqx 'SECRET_KEY=0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef' "$real_env"
