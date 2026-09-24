#!/usr/bin/env bats

setup() {
  load 'test-stub-bin'
  stub_bin_setup
  export XDG_CONFIG_HOME="$BATS_TEST_TMPDIR/config"
  mkdir -p "$XDG_CONFIG_HOME/capi-shell"
  MULTI_CAPI_SHELL="$BATS_TEST_DIRNAME/multi-capi-shell"
}

teardown() {
  stub_bin_teardown
}

@test "prints usage with --help" {
  run "$MULTI_CAPI_SHELL" --help
  [ "$status" -eq 0 ]
  [[ "$output" == *"Usage: multi-capi-shell"* ]]
}

@test "--direct execs capi-shell with the resolved kubeconfig's KUBECONFIG" {
  cat >"$XDG_CONFIG_HOME/capi-shell/config.yaml" <<'EOF'
kubeconfigs:
  prod:
    path: /tmp/prod-kubeconfig.yaml
    contexts:
      - prod-ctx
EOF
  stub capi-shell <<'EOF'
#!/usr/bin/env bash
echo "capi-shell called with: $*"
echo "KUBECONFIG=$KUBECONFIG"
echo "KUBECONFIG_CONTEXT=$KUBECONFIG_CONTEXT"
EOF
  run "$MULTI_CAPI_SHELL" --direct prod ns foo
  [ "$status" -eq 0 ]
  [[ "$output" == *"capi-shell called with: ns foo"* ]]
  [[ "$output" == *"KUBECONFIG=/tmp/prod-kubeconfig.yaml"* ]]
  [[ "$output" == *"KUBECONFIG_CONTEXT=prod-ctx"* ]]
}

@test "--direct uses the first of multiple configured contexts" {
  cat >"$XDG_CONFIG_HOME/capi-shell/config.yaml" <<'EOF'
kubeconfigs:
  prod:
    path: /tmp/prod-kubeconfig.yaml
    contexts:
      - prod-ctx-1
      - prod-ctx-2
EOF
  stub capi-shell <<'EOF'
#!/usr/bin/env bash
echo "KUBECONFIG_CONTEXT=$KUBECONFIG_CONTEXT"
EOF
  run "$MULTI_CAPI_SHELL" --direct prod ns foo
  [ "$status" -eq 0 ]
  [[ "$output" == *"KUBECONFIG_CONTEXT=prod-ctx-1"* ]]
}

@test "--direct fails clearly for an unknown kubeconfig" {
  cat >"$XDG_CONFIG_HOME/capi-shell/config.yaml" <<'EOF'
kubeconfigs:
  prod:
    path: /tmp/prod-kubeconfig.yaml
EOF
  run "$MULTI_CAPI_SHELL" --direct staging ns foo
  [ "$status" -eq 1 ]
  [[ "$output" == *"Unknown kubeconfig: staging"* ]]
}

@test "fzf selection execs capi-shell with the picked cluster" {
  cat >"$XDG_CONFIG_HOME/capi-shell/config.yaml" <<'EOF'
kubeconfigs:
  prod:
    path: /tmp/prod-kubeconfig.yaml
    contexts:
      - prod-ctx
EOF
  stub kubectl <<'EOF'
#!/usr/bin/env bash
case "$*" in
  *"get cluster -A -o yaml"*)
    cat <<'YAML'
apiVersion: v1
items:
  - metadata:
      namespace: ns1
      name: foo
YAML
    ;;
  *) exit 1 ;;
esac
EOF
  stub fzf <<'EOF'
#!/usr/bin/env bash
cat
EOF
  stub capi-shell <<'EOF'
#!/usr/bin/env bash
echo "capi-shell called with: $*"
echo "KUBECONFIG=$KUBECONFIG"
echo "KUBECONFIG_CONTEXT=$KUBECONFIG_CONTEXT"
EOF
  run "$MULTI_CAPI_SHELL"
  [ "$status" -eq 0 ]
  [[ "$output" == *"capi-shell called with: ns1 foo"* ]]
  [[ "$output" == *"KUBECONFIG=/tmp/prod-kubeconfig.yaml"* ]]
  [[ "$output" == *"KUBECONFIG_CONTEXT=prod-ctx"* ]]
}

@test "fzf mode scans exactly the configured contexts instead of discovering all of them" {
  cat >"$XDG_CONFIG_HOME/capi-shell/config.yaml" <<'EOF'
kubeconfigs:
  prod:
    path: /tmp/prod-kubeconfig.yaml
    contexts:
      - prod-ctx-1
      - prod-ctx-2
EOF
  contexts_log="$BATS_TEST_TMPDIR/contexts.log"
  stub kubectl <<EOF
#!/usr/bin/env bash
case "\$*" in
  "config get-contexts -o name")
    echo "config get-contexts should not have been called" >&2
    exit 1
    ;;
  *"get cluster -A -o yaml"*)
    echo "\$2" >>"$contexts_log"
    cat <<'YAML'
items:
  - metadata:
      namespace: ns1
      name: foo
YAML
    ;;
  *) exit 1 ;;
esac
EOF
  stub fzf <<'EOF'
#!/usr/bin/env bash
input="$(cat)"
head -n1 <<<"$input"
EOF
  stub capi-shell <<'EOF'
#!/usr/bin/env bash
echo "capi-shell called with: $*"
EOF
  run "$MULTI_CAPI_SHELL"
  [ "$status" -eq 0 ]
  [[ "$output" == *"capi-shell called with: ns1 foo"* ]]
  sort "$contexts_log" | tr '\n' ' ' | grep -qx 'prod-ctx-1 prod-ctx-2 '
}
