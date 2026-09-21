# shellcheck shell=bash
api_endpoint_proxy_pre_exec() {
  local namespace="$1" name="$2"
  local base
  base="$(dirname "${BASH_SOURCE[0]}")/api-endpoint-proxy"
  local f
  for f in "$base"/providers/*.sh "$base"/tools/*.sh; do
    # shellcheck disable=SC1090
    [[ -e "$f" ]] && source "$f"
  done

  local endpoint=""
  local fn
  local provider_fns
  mapfile -t provider_fns < <(declare -F | awk '{print $3}' | grep '^api_endpoint_proxy_provider_')
  for fn in "${provider_fns[@]}"; do
    if endpoint="$("$fn" "$namespace" "$name")" && [[ -n "$endpoint" ]]; then
      break
    fi
  done
  [[ -z "$endpoint" ]] && return 0

  local tool="${API_ENDPOINT_PROXY_TOOL:-$(capi_shell_plugin_config api-endpoint-proxy tool)}"
  local tool_fns
  mapfile -t tool_fns < <(declare -F | awk '{print $3}' | grep '^api_endpoint_proxy_tool_')
  if [[ -z "$tool" ]]; then
    if [[ "${#tool_fns[@]}" -eq 1 ]]; then
      tool="${tool_fns[0]#api_endpoint_proxy_tool_}"
    else
      echo "Multiple proxy tools installed; set plugins.api-endpoint-proxy.tool" >&2
      return 0
    fi
  fi
  local host port
  read -r host port <<<"$endpoint"
  "api_endpoint_proxy_tool_${tool}" "$host" "$port"
}

api_endpoint_proxy_cleanup() {
  local state="$1"
  [[ -n "$state" ]] && kill "$state" 2>/dev/null
  true
}

if declare -F capi_shell_register_pre_exec >/dev/null; then
  capi_shell_register_pre_exec api_endpoint_proxy_pre_exec api_endpoint_proxy_cleanup
fi
