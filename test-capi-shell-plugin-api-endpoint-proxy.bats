#!/usr/bin/env bats

setup() {
  load 'test-stub-bin'
  stub_bin_setup
  DISPATCHER="$BATS_TEST_DIRNAME/capi-shell-plugin-api-endpoint-proxy.sh"
  PROVIDER_CAPO="$BATS_TEST_DIRNAME/capi-shell-plugin-api-endpoint-proxy-provider-capo.sh"
  TOOL_SSHUTTLE="$BATS_TEST_DIRNAME/capi-shell-plugin-api-endpoint-proxy-tool-sshuttle.sh"
}

teardown() {
  stub_bin_teardown
}

@test "provider capo prints host+port when the load balancer is restricted" {
  stub kubectl <<'EOF'
#!/usr/bin/env bash
case "$*" in
  *"get openstackcluster -l cluster.x-k8s.io/cluster-name=foo -o yaml"*)
    cat <<'YAML'
items:
  - spec:
      apiServerLoadBalancer:
        allowedCIDRs: ["10.0.0.0/8"]
      controlPlaneEndpoint:
        host: 10.1.2.3
        port: 6443
YAML
    ;;
  *) exit 1 ;;
esac
EOF
  run bash -c 'source "'"$PROVIDER_CAPO"'"; api_endpoint_proxy_provider_capo ns foo'
  [ "$status" -eq 0 ]
  [ "$output" = "10.1.2.3 6443" ]
}

@test "provider capo prints nothing when the load balancer is not restricted" {
  stub kubectl <<'EOF'
#!/usr/bin/env bash
case "$*" in
  *"get openstackcluster -l cluster.x-k8s.io/cluster-name=foo -o yaml"*)
    cat <<'YAML'
items:
  - spec:
      controlPlaneEndpoint:
        host: 10.1.2.3
        port: 6443
YAML
    ;;
  *) exit 1 ;;
esac
EOF
  run bash -c 'source "'"$PROVIDER_CAPO"'"; api_endpoint_proxy_provider_capo ns foo'
  [ "$status" -eq 1 ]
  [ -z "$output" ]
}

@test "tool sshuttle backgrounds sshuttle and prints its PID when a host is configured" {
  stub sshuttle <<'EOF'
#!/usr/bin/env bash
echo "sshuttle called with: $*" >>"$SSHUTTLE_LOG"
sleep 5 &
wait
EOF
  export SSHUTTLE_LOG="$BATS_TEST_TMPDIR/sshuttle.log"
  export API_ENDPOINT_PROXY_SSHUTTLE_HOST="jump.example.com"
  run bash -c 'source "'"$TOOL_SSHUTTLE"'"; api_endpoint_proxy_tool_sshuttle 10.1.2.3 6443'
  [ "$status" -eq 0 ]
  [[ "$output" =~ ^[0-9]+$ ]]
  kill "$output" 2>/dev/null || true
}

@test "tool sshuttle prints nothing and fails when no host is configured" {
  unset API_ENDPOINT_PROXY_SSHUTTLE_HOST
  export CAPI_SHELL_CONFIG_PATH="$BATS_TEST_TMPDIR/nonexistent.yaml"
  run bash -c 'source "'"$TOOL_SSHUTTLE"'"; capi_shell_plugin_config() { echo ""; }; api_endpoint_proxy_tool_sshuttle 10.1.2.3 6443'
  [ "$status" -eq 1 ]
  [ -z "$output" ]
}

@test "dispatcher backgrounds sshuttle via the capo provider and cleans it up" {
  stub kubectl <<'EOF'
#!/usr/bin/env bash
case "$*" in
  *"get openstackcluster -l cluster.x-k8s.io/cluster-name=foo -o yaml"*)
    cat <<'YAML'
items:
  - spec:
      apiServerLoadBalancer:
        allowedCIDRs: ["10.0.0.0/8"]
      controlPlaneEndpoint:
        host: 10.1.2.3
        port: 6443
YAML
    ;;
  *) exit 1 ;;
esac
EOF
  stub sshuttle <<'EOF'
#!/usr/bin/env bash
echo "$*" >>"$SSHUTTLE_LOG"
sleep 5 &
wait
EOF
  export SSHUTTLE_LOG="$BATS_TEST_TMPDIR/sshuttle.log"
  export API_ENDPOINT_PROXY_SSHUTTLE_HOST="jump.example.com"
  run bash -c '
    source "'"$PROVIDER_CAPO"'"
    source "'"$TOOL_SSHUTTLE"'"
    source "'"$DISPATCHER"'"
    state="$(api_endpoint_proxy_pre_exec ns foo)"
    [[ "$state" =~ ^[0-9]+$ ]] || exit 1
    kill -0 "$state" || exit 1
    for i in $(seq 1 50); do
      [[ -s "$SSHUTTLE_LOG" ]] && break
      sleep 0.1
    done
    api_endpoint_proxy_cleanup "$state"
    sleep 0.2
    ! kill -0 "$state" 2>/dev/null
  '
  [ "$status" -eq 0 ]
  [[ "$(cat "$SSHUTTLE_LOG")" == *"jump.example.com"*"10.1.2.3:6443"* ]]
}

@test "dispatcher does nothing when no provider reports an endpoint" {
  stub kubectl <<'EOF'
#!/usr/bin/env bash
exit 1
EOF
  run bash -c 'source "'"$DISPATCHER"'"; api_endpoint_proxy_pre_exec ns foo; echo "rc=$?"'
  [ "$status" -eq 0 ]
  [[ "$output" == "rc=0" ]]
}

@test "dispatcher warns and skips when multiple tools are installed and none is configured" {
  stub kubectl <<'EOF'
#!/usr/bin/env bash
case "$*" in
  *"get openstackcluster -l cluster.x-k8s.io/cluster-name=foo -o yaml"*)
    cat <<'YAML'
items:
  - spec:
      apiServerLoadBalancer:
        allowedCIDRs: ["10.0.0.0/8"]
      controlPlaneEndpoint:
        host: 10.1.2.3
        port: 6443
YAML
    ;;
  *) exit 1 ;;
esac
EOF
  run bash -c '
    source "'"$PROVIDER_CAPO"'"
    source "'"$TOOL_SSHUTTLE"'"
    source "'"$DISPATCHER"'"
    api_endpoint_proxy_tool_other() { echo "should-not-run"; }
    unset API_ENDPOINT_PROXY_TOOL
    state="$(api_endpoint_proxy_pre_exec ns foo)"
    echo "state=[$state]"
  '
  [ "$status" -eq 0 ]
  [[ "$output" == *"Multiple proxy tools installed"* ]]
  [[ "$output" == *"state=[]"* ]]
}
