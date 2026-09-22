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

  local argv_raw
  if ! argv_raw="$("api_endpoint_proxy_tool_${tool}" "$host" "$port")" || [[ -z "$argv_raw" ]]; then
    return 0
  fi
  local argv
  mapfile -t argv <<<"$argv_raw"

  local slice="capi-shell-api-endpoint-proxy.slice"
  local unit="capi-shell-api-endpoint-proxy-${tool}-${host}:${port}"
  local systemd_err
  if systemd_err="$(systemd-run --user --unit="$unit" --slice="$slice" --collect --quiet -- "${argv[@]}" 2>&1 >/dev/null)"; then
    return 0
  fi
  if systemctl --user is-active --quiet "$unit"; then
    return 0
  fi
  echo "Failed to start proxy via systemd-run: $systemd_err" >&2
  return 0
}

if declare -F capi_shell_register_pre_exec >/dev/null; then
  capi_shell_register_pre_exec api_endpoint_proxy_pre_exec
fi
