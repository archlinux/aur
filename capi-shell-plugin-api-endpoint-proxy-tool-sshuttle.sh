# shellcheck shell=bash
api_endpoint_proxy_tool_sshuttle() {
  local host="$1" port="$2"
  local sshuttle_host="${API_ENDPOINT_PROXY_SSHUTTLE_HOST:-$(capi_shell_plugin_config api-endpoint-proxy sshuttle.host)}"
  [[ -z "$sshuttle_host" ]] && return 1
  sshuttle -r "$sshuttle_host" "$host:$port" &>/dev/null &
  echo $!
}
