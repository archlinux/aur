#!/usr/bin/env bash
set -eu
real="${LIGHTHOUSE_REAL_GCC:?}"

_sanitize_rsp() {
  local _path="$1"
  local _canon
  _canon="$(realpath "$_path" 2>/dev/null || printf '%s' "$_path")"
  if [[ -n "${LIGHTHOUSE_RSP_DONE[$_canon]+x}" ]]; then
    printf '%s' "${LIGHTHOUSE_RSP_DONE[$_canon]}"
    return 0
  fi

  local _content _t _refs _token _inner _rep
  _content="$(cat "$_path")"

  mapfile -t _refs < <(grep -oE '@[^[:space:]]+' <<<"$_content" | sort -u \
    | awk '{ print length($0) "\t" $0 }' | sort -nr | cut -f2-)

  for _token in "${_refs[@]}"; do
    _inner="${_token#@}"
    [[ "$_inner" == /* ]] || continue
    [[ -f "$_inner" ]] || continue
    _rep="$(_sanitize_rsp "$_inner")"
    _content="${_content//$_token/@$_rep}"
  done

  _t="$(mktemp "${TMPDIR:-/tmp}/lighthouse-rsp.XXXXXX")"
  _rsp_tmp+=("$_t")
  printf '%s' "$_content" | sed -E \
    -e 's/[[:space:]]*-Wl,--gc-sections//g' \
    -e 's/[[:space:]]*-Wl,-gc-sections//g' \
    -e 's/[[:space:]]*-fuse-ld=lld//g' \
    -e 's/[[:space:]]*-fuse-ld=bfd//g' \
    -e 's/[[:space:]]*--gc-sections//g' \
    -e 's/[[:space:]]*-Wl,--as-needed//g' \
    -e 's/[[:space:]]*-Wl,-as-needed//g' \
    > "$_t"

  LIGHTHOUSE_RSP_DONE[$_canon]="$_t"
  printf '%s' "$_t"
}

unset LIGHTHOUSE_RSP_DONE 2>/dev/null || true
declare -A LIGHTHOUSE_RSP_DONE

_rsp_tmp=()
_cleanup() { rm -f "${_rsp_tmp[@]}"; }
trap _cleanup EXIT

_filtered=()
for _a in "$@"; do
  if [[ "$_a" == @* ]]; then
    _f="${_a#@}"
    if [[ ! -r "$_f" ]]; then
      _filtered+=("$_a")
      continue
    fi
    _t="$(_sanitize_rsp "$_f")"
    _filtered+=("@$_t")
  else
    case "$_a" in
      -Wl,--gc-sections|-Wl,-gc-sections|-fuse-ld=lld|-fuse-ld=bfd|--gc-sections|-gc-sections) ;;
      -Wl,--as-needed|-Wl,-as-needed) ;;
      *) _filtered+=("$_a") ;;
    esac
  fi
done

if [[ "${LIGHTHOUSE_LINK_DEBUG:-}" == 1 ]]; then
  printf 'lighthouse-link-gcc: LIGHTHOUSE_REAL_GCC=%s filtered_argc=%s\n' "$real" "${#_filtered[@]}" >&2
fi

set +e
"$real" -fuse-ld=lld -Wl,--no-gc-sections -Wl,--no-as-needed "${_filtered[@]}" -Wl,--no-gc-sections -Wl,--no-as-needed
_code=$?
_cleanup
trap - EXIT
exit "$_code"
