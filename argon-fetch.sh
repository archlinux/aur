#!/usr/bin/env bash
set -euo pipefail

# p0: EU / default; p1: US, CA; p2: RU, BY.
# app.argon.gl selects the region. Missing or unrecognised links fall back to RU.
readonly page_url='https://app.argon.gl'
readonly release_url='https://eu-central-manifest.argon.gl/live/release.json'
readonly fallback_mirror='https://ru-central-updates.argon.gl'
readonly appimage_name='ArgonChat-x86_64.AppImage'
readonly -a curl_options=(
  --fail --location --silent --show-error
  --connect-timeout 30 --max-time 30
  --proto '=https' --proto-redir '=https'
)

for dependency in curl jq; do
  if ! command -v "$dependency" >/dev/null 2>&1; then
    printf 'Required command not found: %s\n' "$dependency" >&2
    exit 1
  fi
done

release_version() {
  # Keep the upstream string unchanged; reject versions invalid for makepkg.
  jq -er '
    .bootstrapper.version
    | select(type == "string")
    | select(test("^[A-Za-z0-9_+][A-Za-z0-9._+]*$"))
  ' "$@"
}

if [[ ${1:-} == --version ]]; then
  curl "${curl_options[@]}" "$release_url" | release_version
  exit
fi

output_dir=${1:-.}
expected_version=${2:-}
mkdir -p -- "$output_dir"
work_dir=$(mktemp -d "$output_dir/.argon-fetch.XXXXXXXX")
trap 'rm -rf -- "$work_dir"' EXIT

mirror=$fallback_mirror
if curl "${curl_options[@]}" "$page_url" -o "$work_dir/page.html"; then
  # Only accept an AppImage href on an <a> element and a known HTTPS mirror.
  # Flatten line breaks so multiline attributes are accepted as well.
  anchor_pattern='<a[[:space:]][^>]*>'
  href_pattern="[[:space:]]href[[:space:]]*=[[:space:]]*[\"'](https://(eu-central-updates|us-central-updates|ru-central-updates)\\.argon\\.gl)/ArgonChat-x86_64\\.AppImage[\"']"
  while IFS= read -r anchor; do
    if [[ $anchor =~ $href_pattern ]]; then
      mirror=${BASH_REMATCH[1]}
      break
    fi
  done < <(tr '\r\n' '  ' < "$work_dir/page.html" | grep -Eio "$anchor_pattern" || true)
else
  printf 'Download page unavailable; falling back to RU.\n' >&2
fi
printf 'Mirror: %s\n' "$mirror" >&2

curl "${curl_options[@]}" "$release_url" -o "$work_dir/release.json"
version=$(release_version "$work_dir/release.json") || {
  printf 'release.json has no valid bootstrapper.version string.\n' >&2
  exit 1
}
if [[ -n $expected_version && $version != "$expected_version" ]]; then
  printf 'Release changed from %s to %s; restart makepkg.\n' "$expected_version" "$version" >&2
  exit 1
fi
printf 'Version: %s\n' "$version" >&2

curl "${curl_options[@]}" "$mirror/$appimage_name" -o "$work_dir/$appimage_name"
if [[ ! -s $work_dir/$appimage_name ]]; then
  printf 'Downloaded AppImage is empty.\n' >&2
  exit 1
fi

printf '%s\n' "$version" > "$work_dir/argon-version"
mv -f -- "$work_dir/$appimage_name" "$output_dir/$appimage_name"
mv -f -- "$work_dir/release.json" "$output_dir/release.json"
mv -f -- "$work_dir/argon-version" "$output_dir/argon-version"
