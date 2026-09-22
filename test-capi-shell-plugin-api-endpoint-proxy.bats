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

@test "tool sshuttle prints the sshuttle argv when a host is configured" {
  export API_ENDPOINT_PROXY_SSHUTTLE_HOST="jump.example.com"
  run bash -c 'source "'"$TOOL_SSHUTTLE"'"; api_endpoint_proxy_tool_sshuttle 10.1.2.3 6443'
  [ "$status" -eq 0 ]
  printf -v expected 'sshuttle\n-r\njump.example.com\n10.1.2.3:6443'
  [ "$output" = "$expected" ]
}

@test "tool sshuttle prints nothing and fails when no host is configured" {
  unset API_ENDPOINT_PROXY_SSHUTTLE_HOST
  export CAPI_SHELL_CONFIG_PATH="$BATS_TEST_TMPDIR/nonexistent.yaml"
  run bash -c 'source "'"$TOOL_SSHUTTLE"'"; capi_shell_plugin_config() { echo ""; }; api_endpoint_proxy_tool_sshuttle 10.1.2.3 6443'
  [ "$status" -eq 1 ]
  [ -z "$output" ]
}

@test "dispatcher starts the proxy via systemd-run in the plugin's slice" {
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
  stub systemd-run <<'EOF'
#!/usr/bin/env bash
echo "$*" >>"$SYSTEMD_RUN_LOG"
exit 0
EOF
  export SYSTEMD_RUN_LOG="$BATS_TEST_TMPDIR/systemd-run.log"
  export API_ENDPOINT_PROXY_SSHUTTLE_HOST="jump.example.com"
  export API_ENDPOINT_PROXY_TOOL="sshuttle"
  run bash -c '
    source "'"$PROVIDER_CAPO"'"
    source "'"$TOOL_SSHUTTLE"'"
    source "'"$DISPATCHER"'"
    api_endpoint_proxy_pre_exec ns foo
  '
  [ "$status" -eq 0 ]
  log="$(cat "$SYSTEMD_RUN_LOG")"
  [[ "$log" == *"--user"* ]]
  [[ "$log" == *"--unit=capi-shell-api-endpoint-proxy-sshuttle-10.1.2.3:6443"* ]]
  [[ "$log" == *"--slice=capi-shell-api-endpoint-proxy.slice"* ]]
  [[ "$log" == *"sshuttle -r jump.example.com 10.1.2.3:6443"* ]]
}

@test "dispatcher reuses an already-active proxy unit instead of starting a duplicate" {
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
  stub systemd-run <<'EOF'
#!/usr/bin/env bash
echo "Unit capi-shell-api-endpoint-proxy-sshuttle-10.1.2.3:6443.service already exists." >&2
exit 1
EOF
  stub systemctl <<'EOF'
#!/usr/bin/env bash
case "$*" in
  "--user is-active --quiet capi-shell-api-endpoint-proxy-sshuttle-10.1.2.3:6443") exit 0 ;;
  *) exit 1 ;;
esac
EOF
  export API_ENDPOINT_PROXY_SSHUTTLE_HOST="jump.example.com"
  export API_ENDPOINT_PROXY_TOOL="sshuttle"
  run bash -c '
    source "'"$PROVIDER_CAPO"'"
    source "'"$TOOL_SSHUTTLE"'"
    source "'"$DISPATCHER"'"
    api_endpoint_proxy_pre_exec ns foo
  '
  [ "$status" -eq 0 ]
  [ -z "$output" ]
}

@test "dispatcher warns when systemd-run fails and no matching unit is active" {
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
  stub systemd-run <<'EOF'
#!/usr/bin/env bash
echo "boom" >&2
exit 1
EOF
  stub systemctl <<'EOF'
#!/usr/bin/env bash
exit 1
EOF
  export API_ENDPOINT_PROXY_SSHUTTLE_HOST="jump.example.com"
  export API_ENDPOINT_PROXY_TOOL="sshuttle"
  run bash -c '
    source "'"$PROVIDER_CAPO"'"
    source "'"$TOOL_SSHUTTLE"'"
    source "'"$DISPATCHER"'"
    api_endpoint_proxy_pre_exec ns foo
  '
  [ "$status" -eq 0 ]
  [[ "$output" == *"Failed to start proxy via systemd-run"*"boom"* ]]
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
