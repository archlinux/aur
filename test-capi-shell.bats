#!/usr/bin/env bats

setup() {
  load 'test-stub-bin'
  stub_bin_setup
  export XDG_RUNTIME_DIR="$BATS_TEST_TMPDIR"
  export XDG_CONFIG_HOME="$BATS_TEST_TMPDIR/config"
  mkdir -p "$XDG_CONFIG_HOME"
  export _CAPI_SHELL_PLUGIN_DIR="$BATS_TEST_TMPDIR/no-plugins-by-default"
  CAPI_SHELL="$BATS_TEST_DIRNAME/capi-shell"
}

teardown() {
  stub_bin_teardown
}

@test "prints usage with --help" {
  run "$CAPI_SHELL" --help
  [ "$status" -eq 0 ]
  [[ "$output" == *"Usage: capi-shell"* ]]
}

@test "sets KUBECONFIG from the fetched secret and execs the command" {
  stub kubectl <<'EOF'
#!/usr/bin/env bash
case "$*" in
  *"get secrets foo-kubeconfig -o jsonpath={.data.value}"*)
    printf '%s' "$(printf 'apiVersion: v1\nclusters: []\ncontexts: []\nusers: []\ncurrent-context: ""\nkind: Config\n' | base64 -w0)"
    ;;
  *"get cluster foo -o yaml"*) exit 1 ;;
  *"auth whoami"*) exit 1 ;;
  *) exit 1 ;;
esac
EOF
  run "$CAPI_SHELL" ns foo env
  [ "$status" -eq 0 ]
  [[ "$output" == *"KUBECONFIG="* ]]
}

@test "falls back to empty KUBECONFIG and warns when the secret is missing" {
  stub kubectl <<'EOF'
#!/usr/bin/env bash
exit 1
EOF
  run "$CAPI_SHELL" ns foo env
  [ "$status" -eq 1 ]
  [[ "$output" == *"All secrets are missing!"* ]]
}

@test "capi_shell_plugin_config resolves per-cluster override over global default" {
  mkdir -p "$XDG_CONFIG_HOME/capi-shell"
  cat >"$XDG_CONFIG_HOME/capi-shell/config.yaml" <<'EOF'
management_clusters:
  prod:
    kubeconfig: /tmp/prod.yaml
    plugins:
      api-endpoint-proxy:
        sshuttle:
          host: prod-jump.example.com
plugins:
  api-endpoint-proxy:
    sshuttle:
      host: global-jump.example.com
EOF
  source "$CAPI_SHELL"
  CAPI_SHELL_CONFIG_PATH="$XDG_CONFIG_HOME/capi-shell/config.yaml"
  _CAPI_SHELL_MGMT_CLUSTER_NAME="prod"
  result="$(capi_shell_plugin_config api-endpoint-proxy sshuttle.host)"
  [ "$result" = "prod-jump.example.com" ]
}

@test "capi_shell_plugin_config falls back to the global default with no per-cluster match" {
  mkdir -p "$XDG_CONFIG_HOME/capi-shell"
  cat >"$XDG_CONFIG_HOME/capi-shell/config.yaml" <<'EOF'
plugins:
  api-endpoint-proxy:
    sshuttle:
      host: global-jump.example.com
EOF
  source "$CAPI_SHELL"
  CAPI_SHELL_CONFIG_PATH="$XDG_CONFIG_HOME/capi-shell/config.yaml"
  _CAPI_SHELL_MGMT_CLUSTER_NAME=""
  result="$(capi_shell_plugin_config api-endpoint-proxy sshuttle.host)"
  [ "$result" = "global-jump.example.com" ]
}

@test "capi_shell_plugin_config falls back to the given default when unset" {
  mkdir -p "$XDG_CONFIG_HOME/capi-shell"
  echo "{}" >"$XDG_CONFIG_HOME/capi-shell/config.yaml"
  source "$CAPI_SHELL"
  CAPI_SHELL_CONFIG_PATH="$XDG_CONFIG_HOME/capi-shell/config.yaml"
  _CAPI_SHELL_MGMT_CLUSTER_NAME=""
  result="$(capi_shell_plugin_config api-endpoint-proxy tool "fallback-tool")"
  [ "$result" = "fallback-tool" ]
}

@test "capi_shell_plugin_config expands \$VAR references in the resolved value via envsubst" {
  mkdir -p "$XDG_CONFIG_HOME/capi-shell"
  cat >"$XDG_CONFIG_HOME/capi-shell/config.yaml" <<'EOF'
plugins:
  api-endpoint-proxy:
    sshuttle:
      host: $THAT_VAR
EOF
  source "$CAPI_SHELL"
  CAPI_SHELL_CONFIG_PATH="$XDG_CONFIG_HOME/capi-shell/config.yaml"
  _CAPI_SHELL_MGMT_CLUSTER_NAME=""
  export THAT_VAR="expanded-jump.example.com"
  result="$(capi_shell_plugin_config api-endpoint-proxy sshuttle.host)"
  [ "$result" = "expanded-jump.example.com" ]
}

@test "sets management cluster name by matching KUBECONFIG against config" {
  mkdir -p "$XDG_CONFIG_HOME/capi-shell"
  cat >"$XDG_CONFIG_HOME/capi-shell/config.yaml" <<'EOF'
management_clusters:
  prod:
    kubeconfig: /tmp/prod-kubeconfig.yaml
EOF
  stub kubectl <<'EOF'
#!/usr/bin/env bash
exit 1
EOF
  CAPI_SHELL_CONFIG_PATH="$XDG_CONFIG_HOME/capi-shell/config.yaml" KUBECONFIG=/tmp/prod-kubeconfig.yaml run "$CAPI_SHELL" ns foo env
  [[ "$output" == *"All secrets are missing!"* ]]
}

@test "end to end: KUBECONFIG matching resolves the per-cluster plugin config value through to a pre-exec hook" {
  mkdir -p "$XDG_CONFIG_HOME/capi-shell"
  cat >"$XDG_CONFIG_HOME/capi-shell/config.yaml" <<'EOF'
management_clusters:
  prod:
    kubeconfig: /tmp/prod-kubeconfig.yaml
    plugins:
      mgmt-e2e-test:
        some:
          key: per-cluster-only-value
EOF
  plugin_dir="$BATS_TEST_TMPDIR/plugins"
  mkdir -p "$plugin_dir"
  marker="$BATS_TEST_TMPDIR/mgmt-e2e-marker"
  cat >"$plugin_dir/fake-mgmt.sh" <<EOF
fake_mgmt_pre_exec() {
  capi_shell_plugin_config mgmt-e2e-test some.key
}
fake_mgmt_cleanup() {
  echo "\$1" >"$marker"
}
capi_shell_register_pre_exec fake_mgmt_pre_exec fake_mgmt_cleanup
EOF
  stub kubectl <<'EOF'
#!/usr/bin/env bash
case "$*" in
  *"get secrets foo-kubeconfig -o jsonpath={.data.value}"*)
    printf '%s' "$(printf 'apiVersion: v1\nclusters: []\ncontexts: []\nusers: []\ncurrent-context: ""\nkind: Config\n' | base64 -w0)"
    ;;
  *) exit 1 ;;
esac
EOF
  _CAPI_SHELL_PLUGIN_DIR="$plugin_dir" KUBECONFIG=/tmp/prod-kubeconfig.yaml run "$CAPI_SHELL" ns foo true
  [ "$(cat "$marker")" = "per-cluster-only-value" ]
}

@test "loads a plugin's capi_shell_plugin_env hook and applies its env vars" {
  plugin_dir="$BATS_TEST_TMPDIR/plugins"
  mkdir -p "$plugin_dir"
  cat >"$plugin_dir/fake.sh" <<'EOF'
capi_shell_plugin_env() {
  printf 'FAKE_TOKEN=abc123\0'
  return 0
}
EOF
  stub kubectl <<'EOF'
#!/usr/bin/env bash
case "$*" in
  *"get secrets foo-kubeconfig -o jsonpath={.data.value}"*) exit 1 ;;
  *) exit 1 ;;
esac
EOF
  _CAPI_SHELL_PLUGIN_DIR="$plugin_dir" run "$CAPI_SHELL" ns foo env
  [ "$status" -eq 0 ]
  [[ "$output" == *"FAKE_TOKEN=abc123"* ]]
}

@test "a plugin env hook that returns 1 still applies its cleanup lines but keeps the warning" {
  plugin_dir="$BATS_TEST_TMPDIR/plugins"
  mkdir -p "$plugin_dir"
  cat >"$plugin_dir/fake.sh" <<'EOF'
capi_shell_plugin_env() {
  printf 'FAKE_TOKEN=\0'
  return 1
}
EOF
  stub kubectl <<'EOF'
#!/usr/bin/env bash
case "$*" in
  *"get secrets foo-kubeconfig -o jsonpath={.data.value}"*)
    printf '%s' "$(printf 'apiVersion: v1\nclusters: []\ncontexts: []\nusers: []\ncurrent-context: ""\nkind: Config\n' | base64 -w0)"
    ;;
  *) exit 1 ;;
esac
EOF
  _CAPI_SHELL_PLUGIN_DIR="$plugin_dir" run "$CAPI_SHELL" ns foo env
  [ "$status" -eq 0 ]
  [[ "$output" == *"FAKE_TOKEN="* ]]
  [[ "$output" == *"Provider plugin found no credentials"* ]]
}

@test "fails when neither kubeconfig nor any plugin env is found" {
  plugin_dir="$BATS_TEST_TMPDIR/plugins"
  mkdir -p "$plugin_dir"
  cat >"$plugin_dir/fake.sh" <<'EOF'
capi_shell_plugin_env() {
  return 1
}
EOF
  stub kubectl <<'EOF'
#!/usr/bin/env bash
exit 1
EOF
  _CAPI_SHELL_PLUGIN_DIR="$plugin_dir" run "$CAPI_SHELL" ns foo env
  [ "$status" -eq 1 ]
  [[ "$output" == *"All secrets are missing!"* ]]
}

@test "runs a registered pre-exec function and calls its paired cleanup with the captured state on exit" {
  plugin_dir="$BATS_TEST_TMPDIR/plugins"
  mkdir -p "$plugin_dir"
  marker="$BATS_TEST_TMPDIR/cleanup-marker"
  cat >"$plugin_dir/fake.sh" <<EOF
fake_pre_exec() {
  echo "some-state-123"
}
fake_cleanup() {
  echo "\$1" >"$marker"
}
capi_shell_register_pre_exec fake_pre_exec fake_cleanup
EOF
  stub kubectl <<'EOF'
#!/usr/bin/env bash
case "$*" in
  *"get secrets foo-kubeconfig -o jsonpath={.data.value}"*)
    printf '%s' "$(printf 'apiVersion: v1\nclusters: []\ncontexts: []\nusers: []\ncurrent-context: ""\nkind: Config\n' | base64 -w0)"
    ;;
  *) exit 1 ;;
esac
EOF
  _CAPI_SHELL_PLUGIN_DIR="$plugin_dir" run "$CAPI_SHELL" ns foo true
  [ "$status" -eq 0 ]
  [ "$(cat "$marker")" = "some-state-123" ]
}

@test "a pre-exec function with no paired cleanup is simply not followed up on" {
  plugin_dir="$BATS_TEST_TMPDIR/plugins"
  mkdir -p "$plugin_dir"
  cat >"$plugin_dir/fake.sh" <<'EOF'
fake_pre_exec() {
  echo "unused-state"
}
capi_shell_register_pre_exec fake_pre_exec
EOF
  stub kubectl <<'EOF'
#!/usr/bin/env bash
case "$*" in
  *"get secrets foo-kubeconfig -o jsonpath={.data.value}"*)
    printf '%s' "$(printf 'apiVersion: v1\nclusters: []\ncontexts: []\nusers: []\ncurrent-context: ""\nkind: Config\n' | base64 -w0)"
    ;;
  *) exit 1 ;;
esac
EOF
  _CAPI_SHELL_PLUGIN_DIR="$plugin_dir" run "$CAPI_SHELL" ns foo true
  [ "$status" -eq 0 ]
}

@test "a failing cleanup function does not abort the cleanup loop or clobber the exit code" {
  plugin_dir="$BATS_TEST_TMPDIR/plugins"
  mkdir -p "$plugin_dir"
  marker1="$BATS_TEST_TMPDIR/marker1"
  marker2="$BATS_TEST_TMPDIR/marker2"
  cat >"$plugin_dir/fake.sh" <<EOF
fake_pre_exec1() {
  echo "state1"
}
fake_cleanup1() {
  echo "cleanup1" >"$marker1"
  return 1
}
fake_pre_exec2() {
  echo "state2"
}
fake_cleanup2() {
  echo "cleanup2" >"$marker2"
  return 0
}
capi_shell_register_pre_exec fake_pre_exec1 fake_cleanup1
capi_shell_register_pre_exec fake_pre_exec2 fake_cleanup2
EOF
  stub kubectl <<'EOF'
#!/usr/bin/env bash
case "$*" in
  *"get secrets foo-kubeconfig -o jsonpath={.data.value}"*)
    printf '%s' "$(printf 'apiVersion: v1\nclusters: []\ncontexts: []\nusers: []\ncurrent-context: ""\nkind: Config\n' | base64 -w0)"
    ;;
  *) exit 1 ;;
esac
EOF
  _CAPI_SHELL_PLUGIN_DIR="$plugin_dir" run "$CAPI_SHELL" ns foo true
  [ "$status" -eq 0 ]
  [ -f "$marker1" ]
  [ -f "$marker2" ]
  [ "$(cat "$marker1")" = "cleanup1" ]
  [ "$(cat "$marker2")" = "cleanup2" ]
}

@test "a pre-exec registered but never invoked (early exit) does not trigger its cleanup" {
  plugin_dir="$BATS_TEST_TMPDIR/plugins"
  mkdir -p "$plugin_dir"
  marker="$BATS_TEST_TMPDIR/cleanup-marker"
  cat >"$plugin_dir/fake.sh" <<EOF
fake_pre_exec() {
  echo "should-not-run"
}
fake_cleanup() {
  echo "cleanup-ran" >"$marker"
}
capi_shell_register_pre_exec fake_pre_exec fake_cleanup
EOF
  stub kubectl <<'EOF'
#!/usr/bin/env bash
exit 1
EOF
  _CAPI_SHELL_PLUGIN_DIR="$plugin_dir" run "$CAPI_SHELL" ns foo true
  [ "$status" -eq 1 ]
  [ ! -f "$marker" ]
}
