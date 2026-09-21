# Bats helper: stub external commands (kubectl, sshuttle, ...) on PATH.
stub_bin_setup() {
  STUB_BIN_DIR="$(mktemp -d)"
  PATH="$STUB_BIN_DIR:$PATH"
}

stub_bin_teardown() {
  rm -rf "$STUB_BIN_DIR"
}

# Usage: stub kubectl <<'EOF'
# #!/usr/bin/env bash
# ...
# EOF
stub() {
  local name="$1"
  cat >"$STUB_BIN_DIR/$name"
  chmod +x "$STUB_BIN_DIR/$name"
}
