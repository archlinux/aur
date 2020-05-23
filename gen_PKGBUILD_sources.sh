#!/bin/bash

set -eu -o pipefail

die() {
  echo "$@" >&2
  exit 1
}

[[ $# == 1 && -f $1 ]] || die "Usage: $0 requirements.txt"

venv=$(mktemp -d)
depfile=$(mktemp)
trap 'rm -rf $venv $depfile' EXIT

virtualenv2 "$venv"

# shellcheck disable=SC1090
source "$venv/bin/activate"

# Use `pip download' to find the download URLs and checksums of all transitive dependencies
grep -v '^-e' "$1" | \
  pip download -v -d downloads -r /dev/stdin | \
  grep Added | \
  grep -iv setuptools | \
  sed -E 's/.*Added .* from (.*)#sha256=([0-9a-f]+) .*/\1 \2/' > "$depfile"

deactivate

shopt -s lastpipe
cut -d' ' -f1 "$depfile" | readarray -t urls
cut -d' ' -f2 "$depfile" | readarray -t hashes

# Add the URLs to source=
echo 'source+=('
printf '\t%q\n' "${urls[@]}"
echo ')'

# Add the filenames to noextract=
echo 'noextract+=('
printf '\t%q\n' "${urls[@]##*/}"
echo ')'

# Add a sha1sums SKIP for each source
echo 'sha1sums+=('
printf '\t%q\n' "${hashes[@]/*/SKIP}"
echo ')'

# Verify sha256sums
echo 'sha256sums+=('
printf '\t%q\n' "${hashes[@]}"
echo ')'
