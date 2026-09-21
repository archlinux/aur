# shellcheck shell=bash
capi_shell_plugin_env() {
  local namespace="$1" name="$2"
  local secretName
  if ! secretName="$(kubectl -n "$namespace" get openstackcluster -l cluster.x-k8s.io/cluster-name="$name" -o yaml 2>/dev/null | yq -er '.items[0].spec.identityRef.name')"; then
    printf 'OS_AUTH_URL=\0'
    return 1
  fi
  local fields
  if ! fields="$(kubectl -n "$namespace" get secret "$secretName" -o jsonpath='{.data.clouds\.yaml}' 2>/dev/null | base64 -d | yq -er '.clouds.openstack | {OS_AUTH_TYPE: .["auth_type"], OS_AUTH_URL: .auth["auth_url"], OS_APPLICATION_CREDENTIAL_ID: .auth["application_credential_id"], OS_APPLICATION_CREDENTIAL_SECRET: .auth["application_credential_secret"], OS_REGION_NAME: .["region_name"], OS_INTERFACE: .interface, OS_IDENTITY_API_VERSION: .["identity_api_version"]} | to_entries[] | "\(.key)=\(.value)"')" || [[ -z "$fields" ]]; then
    printf 'OS_AUTH_URL=\0'
    return 1
  fi
  printf 'OS_SHELL=true\0'
  local line
  while IFS= read -r line; do
    printf '%s\0' "$line"
  done <<<"$fields"
  return 0
}
