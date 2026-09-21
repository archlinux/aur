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

@test "--direct execs capi-shell with the resolved management cluster's KUBECONFIG" {
  cat >"$XDG_CONFIG_HOME/capi-shell/config.yaml" <<'EOF'
management_clusters:
  prod:
    kubeconfig: /tmp/prod-kubeconfig.yaml
    context: prod-ctx
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

@test "--direct fails clearly for an unknown management cluster" {
  cat >"$XDG_CONFIG_HOME/capi-shell/config.yaml" <<'EOF'
management_clusters:
  prod:
    kubeconfig: /tmp/prod-kubeconfig.yaml
EOF
  run "$MULTI_CAPI_SHELL" --direct staging ns foo
  [ "$status" -eq 1 ]
  [[ "$output" == *"Unknown management cluster: staging"* ]]
}
