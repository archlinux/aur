#!/bin/bash
set -euo pipefail
source "${1:?path to univpn.install required}"
d=$(mktemp -d)
trap 'rm -rf -- "$d"' EXIT
mkdir "$d/dest"
printf 'complete certificate\n' > "$d/src"
chmod 600 "$d/src"
cp() {
  local dest=${!#}
  printf 'partial' > "$dest"
  return 1
}
_univpn_copy_cert "$d/src" "$d/dest/cert.pem"
[[ ! -e $d/dest/cert.pem ]] || { echo 'FAIL: partial certificate published'; exit 1; }
[[ -z $(ls -A -- "$d/dest") ]] || { echo 'FAIL: temporary file left on copy failure'; exit 1; }
unset -f cp
_univpn_copy_cert "$d/src" "$d/dest/cert.pem"
[[ $(< "$d/dest/cert.pem") == 'complete certificate' ]]
[[ $(stat -c '%a' -- "$d/dest/cert.pem") == 600 ]]
ln() {
  local dest=${!#}
  printf 'other writer\n' > "$dest"
  command ln "$@"
}
_univpn_copy_cert "$d/src" "$d/dest/race.pem"
[[ $(< "$d/dest/race.pem") == 'other writer' ]]
[[ $(ls -A -- "$d/dest") == $'cert.pem\nrace.pem' ]]
printf 'PASS: partial write rollback, retry, mode preservation, and no overwrite on publish\n'
