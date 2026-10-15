#!/usr/bin/env bats

# helm and kubectl are replaced by stubs that only record how they were called,
# so the tests check the helm invocation the scripts build, not helm itself.

setup() {
  STUBS="$BATS_TEST_TMPDIR/stubs"
  mkdir -p "$STUBS"

  cat >"$STUBS/helm" <<'EOF'
#!/usr/bin/env bash
# print every argument on its own line, followed by the content of a --values file
for arg in "$@"; do
  echo "ARG:$arg"
done
echo "HELM_DIFF_USE_UPGRADE_DRY_RUN:${HELM_DIFF_USE_UPGRADE_DRY_RUN-unset}"
echo "HELM_DIFF_USE_INSECURE_SERVER_SIDE_DRY_RUN:${HELM_DIFF_USE_INSECURE_SERVER_SIDE_DRY_RUN-unset}"
while [[ "$#" -gt 0 ]]; do
  if [[ "$1" == --values ]]; then
    echo "VALUES<<"
    cat "$2"
    echo ">>VALUES"
  fi
  shift
done
EOF

  cat >"$STUBS/kubectl" <<'EOF'
#!/usr/bin/env bash
# behave like there is no reachable cluster, unless the test opts in
if [[ "$1" == version && -z "$STUB_KUBECTL_CONNECTED" ]]; then
  exit 1
fi
if [[ "$1" == version ]]; then
  exit 0
fi
echo "kubectl $*" >>"$BATS_TEST_TMPDIR/kubectl.log"
exit 1
EOF
  chmod +x "$STUBS/helm" "$STUBS/kubectl"

  export PATH="$STUBS:$PATH"
  export KUBECONFIG="$BATS_TEST_TMPDIR/kubeconfig"
  HR="$BATS_TEST_DIRNAME/hr"
  HR_DIFF="$BATS_TEST_DIRNAME/hrDiff"
  HR_INSTALL="$BATS_TEST_DIRNAME/hrInstall"
  HR_UPGRADE="$BATS_TEST_DIRNAME/hrUpgrade"
  HR_UNINSTALL="$BATS_TEST_DIRNAME/hrUninstall"
}

# write a HelmRelease using a HelmRepository source, source included in the file
write_release() {
  local file="$1" name="${2:-app}" url="${3:-https://charts.example.com}"
  cat >"$file" <<EOF
---
apiVersion: source.toolkit.fluxcd.io/v1
kind: HelmRepository
metadata:
  name: repo
  namespace: apps
spec:
  url: $url
---
apiVersion: helm.toolkit.fluxcd.io/v2
kind: HelmRelease
metadata:
  name: $name
  namespace: apps
spec:
  chart:
    spec:
      chart: mychart
      version: 1.2.3
      sourceRef:
        kind: HelmRepository
        name: repo
  values:
    replicas: 3
EOF
}

@test "every wrapper prints usage for --help" {
  for tool in "$HR" "$HR_DIFF" "$HR_INSTALL" "$HR_UPGRADE" "$HR_UNINSTALL"; do
    run "$tool" --help
    [ "$status" -eq 0 ]
    [[ "$output" == *"Usage:"* ]]
  done
}

@test "help text names the matching command" {
  run "$HR_DIFF" --help
  [[ "$output" == *"Usage: hrDiff"* ]]
  run "$HR_INSTALL" -h
  [[ "$output" == *"Usage: hrInstall"* ]]
  run "$HR_UPGRADE" -h
  [[ "$output" == *"Usage: hrUpgrade"* ]]
  run "$HR_UNINSTALL" -h
  [[ "$output" == *"Usage: hrUninstall"* ]]
}

@test "helmrelease --help without command lists all commands" {
  run "$BATS_TEST_DIRNAME/helmrelease" --help
  [ "$status" -eq 0 ]
  for command in template diff install upgrade uninstall; do
    [[ "$output" == *"$command"* ]]
  done
}

@test "unknown command is rejected" {
  write_release "$BATS_TEST_TMPDIR/hr.yaml"
  run "$BATS_TEST_DIRNAME/helmrelease" bogus "$BATS_TEST_TMPDIR/hr.yaml"
  [ "$status" -ne 0 ]
  [[ "$output" == *"command 'bogus' is not implemented"* ]]
}

@test "input without a HelmRelease fails" {
  cat >"$BATS_TEST_TMPDIR/other.yaml" <<'EOF'
apiVersion: v1
kind: ConfigMap
metadata:
  name: nothing
EOF
  run "$HR" "$BATS_TEST_TMPDIR/other.yaml"
  [ "$status" -ne 0 ]
  [[ "$output" == *"There are no HelmReleases in the input"* ]]
}

@test "template resolves https HelmRepository from the input" {
  write_release "$BATS_TEST_TMPDIR/hr.yaml"
  run "$HR" "$BATS_TEST_TMPDIR/hr.yaml"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Not connected to cluster"* ]]
  [[ "$output" == *$'ARG:template\nARG:app\nARG:--repo\nARG:https://charts.example.com\nARG:mychart\nARG:--namespace=apps\nARG:--version\nARG:1.2.3'* ]]
}

@test "template resolves oci HelmRepository from the input" {
  write_release "$BATS_TEST_TMPDIR/hr.yaml" app oci://registry.example.com/charts
  run "$HR" "$BATS_TEST_TMPDIR/hr.yaml"
  [ "$status" -eq 0 ]
  [[ "$output" == *$'ARG:template\nARG:app\nARG:oci://registry.example.com/charts/mychart\nARG:--namespace=apps'* ]]
}

@test "inline values are passed as a values file" {
  write_release "$BATS_TEST_TMPDIR/hr.yaml"
  run "$HR" "$BATS_TEST_TMPDIR/hr.yaml"
  [ "$status" -eq 0 ]
  [[ "$output" == *$'VALUES<<\n---\nreplicas: 3\n>>VALUES'* ]]
}

@test "stdin is read when passing -" {
  write_release "$BATS_TEST_TMPDIR/hr.yaml"
  run "$HR" - <"$BATS_TEST_TMPDIR/hr.yaml"
  [ "$status" -eq 0 ]
  [[ "$output" == *"ARG:mychart"* ]]
}

@test "source parameter overrides the chart source" {
  write_release "$BATS_TEST_TMPDIR/hr.yaml"
  mkdir "$BATS_TEST_TMPDIR/chart"
  run "$HR" "$BATS_TEST_TMPDIR/hr.yaml" "$BATS_TEST_TMPDIR/chart"
  [ "$status" -eq 0 ]
  [[ "$output" == *$'ARG:template\nARG:--namespace=apps\nARG:app\nARG:'"$BATS_TEST_TMPDIR/chart"$'\nARG:--values'* ]]
}

@test "source url parameter overrides the repository url" {
  write_release "$BATS_TEST_TMPDIR/hr.yaml"
  run "$HR" "$BATS_TEST_TMPDIR/hr.yaml" oci://other.example.com/charts
  [ "$status" -eq 0 ]
  [[ "$output" == *"ARG:oci://other.example.com/charts/mychart"* ]]
}

@test "unsupported parameter is rejected" {
  write_release "$BATS_TEST_TMPDIR/hr.yaml"
  run "$HR" "$BATS_TEST_TMPDIR/hr.yaml" does-not-exist
  [ "$status" -ne 0 ]
  [[ "$output" == *"parameter 'does-not-exist' is not supported"* ]]
}

@test "arguments after -- are forwarded to helm" {
  write_release "$BATS_TEST_TMPDIR/hr.yaml"
  run "$HR" "$BATS_TEST_TMPDIR/hr.yaml" -- --include-crds --debug
  [ "$status" -eq 0 ]
  [[ "$output" == *"ARG:--include-crds"* ]]
  [[ "$output" == *"ARG:--debug"* ]]
}

@test "targetNamespace prefixes the release name and sets the namespace" {
  cat >"$BATS_TEST_TMPDIR/hr.yaml" <<'EOF'
---
apiVersion: source.toolkit.fluxcd.io/v1
kind: HelmRepository
metadata:
  name: repo
  namespace: flux-system
spec:
  url: https://charts.example.com
---
apiVersion: helm.toolkit.fluxcd.io/v2
kind: HelmRelease
metadata:
  name: app
  namespace: flux-system
spec:
  targetNamespace: target
  chart:
    spec:
      chart: mychart
      sourceRef:
        kind: HelmRepository
        name: repo
        namespace: flux-system
EOF
  run "$HR" "$BATS_TEST_TMPDIR/hr.yaml"
  [ "$status" -eq 0 ]
  [[ "$output" == *"ARG:target-app"* ]]
  [[ "$output" == *"ARG:--namespace=target"* ]]
  # no chart version pinned
  [[ "$output" == *$'ARG:--version\nARG:x.x.x'* ]]
}

@test "sourceRef namespace defaults to the HelmRelease namespace, not the targetNamespace" {
  write_release "$BATS_TEST_TMPDIR/hr.yaml"
  yq -y '(select(.kind == "HelmRelease") | .spec.targetNamespace) = "target"' "$BATS_TEST_TMPDIR/hr.yaml" >"$BATS_TEST_TMPDIR/hr.new" && mv "$BATS_TEST_TMPDIR/hr.new" "$BATS_TEST_TMPDIR/hr.yaml"
  run "$HR" "$BATS_TEST_TMPDIR/hr.yaml"
  [ "$status" -eq 0 ]
  [[ "$output" == *"ARG:https://charts.example.com"* ]]
}

@test "spec.releaseName wins over the metadata name" {
  write_release "$BATS_TEST_TMPDIR/hr.yaml"
  yq -y '(select(.kind == "HelmRelease") | .spec.releaseName) = "custom"' "$BATS_TEST_TMPDIR/hr.yaml" >"$BATS_TEST_TMPDIR/hr.new" && mv "$BATS_TEST_TMPDIR/hr.new" "$BATS_TEST_TMPDIR/hr.yaml"
  run "$HR" "$BATS_TEST_TMPDIR/hr.yaml"
  [ "$status" -eq 0 ]
  [[ "$output" == *$'ARG:template\nARG:custom\n'* ]]
}

@test "valuesFrom ConfigMap from the input is merged into the values" {
  write_release "$BATS_TEST_TMPDIR/hr.yaml"
  cat >>"$BATS_TEST_TMPDIR/hr.yaml" <<'EOF'
  valuesFrom:
    - kind: ConfigMap
      name: extra
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: extra
  namespace: apps
data:
  values.yaml: |
    image:
      tag: v9
EOF
  run "$HR" "$BATS_TEST_TMPDIR/hr.yaml"
  [ "$status" -eq 0 ]
  [[ "$output" == *'"replicas": 3'* ]]
  [[ "$output" == *'"tag": "v9"'* ]]
}

@test "valuesFrom with targetPath nests the value" {
  write_release "$BATS_TEST_TMPDIR/hr.yaml"
  cat >>"$BATS_TEST_TMPDIR/hr.yaml" <<'EOF'
  valuesFrom:
    - kind: ConfigMap
      name: extra
      valuesKey: tag
      targetPath: image.tag
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: extra
  namespace: apps
data:
  tag: v9
EOF
  run "$HR" "$BATS_TEST_TMPDIR/hr.yaml"
  [ "$status" -eq 0 ]
  [[ "$output" == *'"replicas": 3'* ]]
  [[ "$output" == *'"tag": "v9"'* ]]
}

@test "multiple HelmReleases are all templated without an index" {
  write_release "$BATS_TEST_TMPDIR/one.yaml" one
  write_release "$BATS_TEST_TMPDIR/two.yaml" two
  cat "$BATS_TEST_TMPDIR/one.yaml" >"$BATS_TEST_TMPDIR/both.yaml"
  yq -y 'select(.kind == "HelmRelease")' "$BATS_TEST_TMPDIR/two.yaml" | sed '1s/^/---\n/' >>"$BATS_TEST_TMPDIR/both.yaml"
  run "$HR" "$BATS_TEST_TMPDIR/both.yaml"
  [ "$status" -eq 0 ]
  [[ "$output" == *$'ARG:template\nARG:one\n'* ]]
  [[ "$output" == *$'ARG:template\nARG:two\n'* ]]
}

@test "-N selects a single HelmRelease by index" {
  write_release "$BATS_TEST_TMPDIR/one.yaml" one
  cat "$BATS_TEST_TMPDIR/one.yaml" >"$BATS_TEST_TMPDIR/both.yaml"
  yq -y 'select(.kind == "HelmRelease") | .metadata.name = "two"' "$BATS_TEST_TMPDIR/one.yaml" | sed '1s/^/---\n/' >>"$BATS_TEST_TMPDIR/both.yaml"
  run "$HR" "$BATS_TEST_TMPDIR/both.yaml" -1
  [ "$status" -eq 0 ]
  [[ "$output" == *$'ARG:template\nARG:two\n'* ]]
  [[ "$output" != *"ARG:one"* ]]
}

@test "out of range index fails and lists the HelmReleases" {
  write_release "$BATS_TEST_TMPDIR/hr.yaml"
  run "$HR" "$BATS_TEST_TMPDIR/hr.yaml" -5
  [ "$status" -ne 0 ]
  [[ "$output" == *"index '5' is out of range"* ]]
  [[ "$output" == *"0: apps/app"* ]]
}

@test "install refuses multiple HelmReleases without an index" {
  write_release "$BATS_TEST_TMPDIR/one.yaml" one
  cat "$BATS_TEST_TMPDIR/one.yaml" >"$BATS_TEST_TMPDIR/both.yaml"
  yq -y 'select(.kind == "HelmRelease") | .metadata.name = "two"' "$BATS_TEST_TMPDIR/one.yaml" | sed '1s/^/---\n/' >>"$BATS_TEST_TMPDIR/both.yaml"
  export STUB_KUBECTL_CONNECTED=1
  run "$HR_INSTALL" "$BATS_TEST_TMPDIR/both.yaml"
  [ "$status" -ne 0 ]
  [[ "$output" == *"You can only install 1 HelmReleases"* ]]
  [[ "$output" == *"0: apps/one"* ]]
  [[ "$output" == *"1: apps/two"* ]]
}

@test "install and upgrade need a cluster connection" {
  write_release "$BATS_TEST_TMPDIR/hr.yaml"
  run "$HR_INSTALL" "$BATS_TEST_TMPDIR/hr.yaml"
  [ "$status" -ne 0 ]
  [[ "$output" == *"command 'install' is not valid when not connected to a cluster"* ]]
  run "$HR_UPGRADE" "$BATS_TEST_TMPDIR/hr.yaml"
  [ "$status" -ne 0 ]
  [[ "$output" == *"command 'upgrade' is not valid when not connected to a cluster"* ]]
}

@test "install, upgrade and uninstall map to the helm command when connected" {
  write_release "$BATS_TEST_TMPDIR/hr.yaml"
  export STUB_KUBECTL_CONNECTED=1
  run "$HR_INSTALL" "$BATS_TEST_TMPDIR/hr.yaml"
  [ "$status" -eq 0 ]
  [[ "$output" == "ARG:install"$'\n'* ]]
  run "$HR_UPGRADE" "$BATS_TEST_TMPDIR/hr.yaml"
  [ "$status" -eq 0 ]
  [[ "$output" == "ARG:upgrade"$'\n'* ]]
  run "$HR_UNINSTALL" "$BATS_TEST_TMPDIR/hr.yaml"
  [ "$status" -eq 0 ]
  [[ "$output" == *$'ARG:uninstall\nARG:--namespace=apps\nARG:app'* ]]
}

@test "template uses server side dry-run when connected" {
  write_release "$BATS_TEST_TMPDIR/hr.yaml"
  export STUB_KUBECTL_CONNECTED=1
  run "$HR" "$BATS_TEST_TMPDIR/hr.yaml"
  [ "$status" -eq 0 ]
  [[ "$output" == *"ARG:--dry-run=server"* ]]
  [[ "$output" != *"Not connected to cluster"* ]]
}

@test "diff runs helm diff upgrade with dry-run defaults" {
  write_release "$BATS_TEST_TMPDIR/hr.yaml"
  export STUB_KUBECTL_CONNECTED=1
  run "$HR_DIFF" "$BATS_TEST_TMPDIR/hr.yaml"
  [ "$status" -eq 0 ]
  [[ "$output" == "ARG:diff"$'\nARG:upgrade\nARG:--show-secrets\nARG:--output=dyff\nARG:--find-renames=1'* ]]
  [[ "$output" == *"HELM_DIFF_USE_UPGRADE_DRY_RUN:true"* ]]
  [[ "$output" == *"HELM_DIFF_USE_INSECURE_SERVER_SIDE_DRY_RUN:true"* ]]
}

@test "diff disables dry-run for --allow-unreleased" {
  write_release "$BATS_TEST_TMPDIR/hr.yaml"
  export STUB_KUBECTL_CONNECTED=1
  run "$HR_DIFF" "$BATS_TEST_TMPDIR/hr.yaml" -- --allow-unreleased
  [ "$status" -eq 0 ]
  [[ "$output" == *"ARG:--allow-unreleased"* ]]
  [[ "$output" == *"HELM_DIFF_USE_UPGRADE_DRY_RUN:false"* ]]
  [[ "$output" == *"HELM_DIFF_USE_INSECURE_SERVER_SIDE_DRY_RUN:false"* ]]
}

@test "diff requires a cluster connection" {
  write_release "$BATS_TEST_TMPDIR/hr.yaml"
  run "$HR_DIFF" "$BATS_TEST_TMPDIR/hr.yaml"
  [ "$status" -ne 0 ]
  [[ "$output" == *"command 'diff' is not valid when not connected to a cluster"* ]]
}

@test "legacy helm.fluxcd.io/v1 release with repository chart" {
  cat >"$BATS_TEST_TMPDIR/hr.yaml" <<'EOF'
apiVersion: helm.fluxcd.io/v1
kind: HelmRelease
metadata:
  name: legacy
  namespace: apps
spec:
  chart:
    repository: https://legacy.example.com
    name: oldchart
    version: 0.1.0
EOF
  run "$HR" "$BATS_TEST_TMPDIR/hr.yaml"
  [ "$status" -eq 0 ]
  [[ "$output" == *$'ARG:--namespace=apps\nARG:--repo\nARG:https://legacy.example.com\nARG:apps-legacy\nARG:oldchart\nARG:--version\nARG:0.1.0'* ]]
}
