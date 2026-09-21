# shellcheck shell=bash
api_endpoint_proxy_provider_capo() {
  local namespace="$1" name="$2"
  local endpoint
  if ! endpoint="$(kubectl -n "$namespace" get openstackcluster -l cluster.x-k8s.io/cluster-name="$name" -o yaml 2>/dev/null | yq -er '.items[0] | if .spec.apiServerLoadBalancer.allowedCIDRs then .spec.controlPlaneEndpoint | "\(.host) \(.port)" else null end')"; then
    return 1
  fi
  echo "$endpoint"
}
