#!/usr/bin/env bats

setup() {
  load 'test-stub-bin'
  stub_bin_setup
  PLUGIN="$BATS_TEST_DIRNAME/capi-shell-plugin-capo.sh"
}

teardown() {
  stub_bin_teardown
}

@test "capi_shell_plugin_env prints OS_* vars as NUL-delimited records on success" {
  stub kubectl <<'EOF'
#!/usr/bin/env bash
case "$*" in
  *"get openstackcluster -l cluster.x-k8s.io/cluster-name=foo -o yaml"*)
    cat <<'YAML'
items:
  - spec:
      identityRef:
        name: foo-cloud-config
YAML
    ;;
  *"-n ns get secret foo-cloud-config -o jsonpath={.data.clouds\.yaml}"*)
    printf '%s' "$(cat <<'CLOUDS' | base64 -w0
clouds:
  openstack:
    auth_type: v3applicationcredential
    auth:
      auth_url: https://example.com:5000
      application_credential_id: abc
      application_credential_secret: def
    region_name: RegionOne
    interface: public
    identity_api_version: "3"
CLOUDS
)"
    ;;
  *) exit 1 ;;
esac
EOF
  # Capture raw output to temp file to verify NUL-byte delimiters exist
  tmpfile=$(mktemp)
  bash -c 'source "'"$PLUGIN"'"; capi_shell_plugin_env ns foo' > "$tmpfile"
  # Verify raw output contains NUL bytes (od shows \0)
  od -c "$tmpfile" | grep -q '\\0'
  rm "$tmpfile"
  # Verify by converting NUL to newlines for readability checks
  run bash -c 'source "'"$PLUGIN"'"; capi_shell_plugin_env ns foo | tr "\0" "\n"'
  [[ "$output" == *"OS_SHELL=true"* ]]
  [[ "$output" == *"OS_AUTH_URL=https://example.com:5000"* ]]
  [[ "$output" == *"OS_APPLICATION_CREDENTIAL_ID=abc"* ]]
}

@test "capi_shell_plugin_env returns 1 and clears OS_AUTH_URL when no OpenStackCluster is found" {
  stub kubectl <<'EOF'
#!/usr/bin/env bash
exit 1
EOF
  run bash -c 'source "'"$PLUGIN"'"; capi_shell_plugin_env ns foo | tr "\0" "\n"; exit ${PIPESTATUS[0]}'
  [ "$status" -eq 1 ]
  [[ "$output" == *"OS_AUTH_URL="* ]]
}

@test "capi_shell_plugin_env returns 1 when secret fetch or parse fails after identityRef resolves" {
  stub kubectl <<'EOF'
#!/usr/bin/env bash
case "$*" in
  *"get openstackcluster -l cluster.x-k8s.io/cluster-name=foo -o yaml"*)
    cat <<'YAML'
items:
  - spec:
      identityRef:
        name: foo-cloud-config
YAML
    ;;
  *"-n ns get secret foo-cloud-config -o jsonpath={.data.clouds\.yaml}"*)
    # Simulate secret not found or malformed
    exit 1
    ;;
  *) exit 1 ;;
esac
EOF
  run bash -c 'source "'"$PLUGIN"'"; capi_shell_plugin_env ns foo | tr "\0" "\n"; exit ${PIPESTATUS[0]}'
  [ "$status" -eq 1 ]
  [[ "$output" == *"OS_AUTH_URL="* ]]
  # Verify OS_SHELL=true was NOT printed (indicates failure was caught)
  [[ "$output" != *"OS_SHELL=true"* ]]
}
