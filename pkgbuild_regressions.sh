#!/usr/bin/env bash
set -euo pipefail

repo_root=$(
  cd "$(dirname "${BASH_SOURCE[0]}")" && pwd
)

# shellcheck source=/dev/null
source "${repo_root}/PKGBUILD"

fail() {
  printf 'FAIL: %s\n' "$*" >&2
  exit 1
}

assert_eq() {
  local expected=$1
  local actual=$2
  local context=$3

  if [[ "${expected}" != "${actual}" ]]; then
    fail "${context}: expected '${expected}', got '${actual}'"
  fi
}

make_repo() {
  local dir=$1

  mkdir -p "${dir}/t3code"
  git -C "${dir}/t3code" init -q
  git -C "${dir}/t3code" config user.name 'Test User'
  git -C "${dir}/t3code" config user.email 'test@example.com'
}

commit_file() {
  local dir=$1
  local content=$2
  local message=$3

  printf '%s\n' "${content}" >"${dir}/t3code/version.txt"
  git -C "${dir}/t3code" add version.txt
  git -C "${dir}/t3code" commit -q -m "${message}"
}

test_pkgver_excludes_nightly_tags() {
  local tmpdir hash actual
  tmpdir=$(mktemp -d)
  trap 'rm -rf "${tmpdir}"' RETURN

  make_repo "${tmpdir}"
  commit_file "${tmpdir}" 'base' 'base'
  git -C "${tmpdir}/t3code" tag v0.0.17

  for n in $(seq 1 54); do
    commit_file "${tmpdir}" "commit ${n}" "commit ${n}"
  done

  git -C "${tmpdir}/t3code" tag nightly-v0.0.18-nightly.20260416.46
  hash=$(git -C "${tmpdir}/t3code" rev-parse --short=7 HEAD)
  actual=$(srcdir="${tmpdir}" pkgver)

  assert_eq \
    "0.0.17.r54.g${hash}" \
    "${actual}" \
    'pkgver should ignore nightly tags and anchor to the latest stable tag'
}

test_pkgver_normalizes_hyphenated_tags() {
  local tmpdir hash actual
  tmpdir=$(mktemp -d)
  trap 'rm -rf "${tmpdir}"' RETURN

  make_repo "${tmpdir}"
  commit_file "${tmpdir}" 'base' 'base'
  git -C "${tmpdir}/t3code" tag v0.0.0-alpha.9
  commit_file "${tmpdir}" 'after alpha' 'after alpha'

  hash=$(git -C "${tmpdir}/t3code" rev-parse --short=7 HEAD)
  actual=$(srcdir="${tmpdir}" pkgver)

  assert_eq \
    "0.0.0.alpha.9.r1.g${hash}" \
    "${actual}" \
    'pkgver should replace tag hyphens with dots so makepkg accepts the version'
}

test_package_options_preserve_appimage_payload() {
  local option_string
  option_string=" ${options[*]-} "

  [[ "${option_string}" == *" !strip "* ]] || fail "options must include !strip for AppImage packaging"
  [[ "${option_string}" == *" !debug "* ]] || fail "options must include !debug to avoid split-debug handling on the AppImage"
}

test_pkgver_excludes_nightly_tags
test_pkgver_normalizes_hyphenated_tags
test_package_options_preserve_appimage_payload
