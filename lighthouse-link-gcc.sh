#!/usr/bin/env bash
set -eu
real="${LIGHTHOUSE_REAL_GCC:?}"

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
    _t="$(mktemp "${TMPDIR:-/tmp}/lighthouse-rsp.XXXXXX")"
    _rsp_tmp+=("$_t")
    sed -E \
      -e 's/[[:space:]]*-Wl,--gc-sections//g' \
      -e 's/[[:space:]]*-Wl,--as-needed//g' \
      -e 's/[[:space:]]*-fuse-ld=lld//g' \
      "$_f" > "$_t"
    _filtered+=("@$_t")
  else
    case "$_a" in
      -Wl,--gc-sections|-Wl,--as-needed|-fuse-ld=lld) ;;
      *) _filtered+=("$_a") ;;
    esac
  fi
done

if [[ "${LIGHTHOUSE_LINK_DEBUG:-}" == 1 ]]; then
  printf 'lighthouse-link-gcc: real=%s argc=%s\n' "$real" "${#_filtered[@]}" >&2
fi

"$real" -fuse-ld=lld -Wl,--no-gc-sections -Wl,--no-as-needed "${_filtered[@]}"
