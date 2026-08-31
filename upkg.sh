#!/usr/bin/env bash
set -euo pipefail

usage() {
  printf 'Usage: %s [--no-verify]\n' "$(basename "$0")"
  printf '\nUpdate the package to the newest stable upstream tag.\n'
}

die() {
  printf 'upkg.sh: error: %s\n' "$*" >&2
  exit 1
}

verify=1
while (($#)); do
  case "$1" in
    --no-verify)
      verify=0
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      die "unknown option: $1"
      ;;
  esac
  shift
done

root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
cd "$root"

pkgbuild="$root/PKGBUILD"
srcinfo="$root/.SRCINFO"

[[ -f "$pkgbuild" ]] || die "PKGBUILD not found"
command -v git >/dev/null || die "git is required"
command -v makepkg >/dev/null || die "makepkg is required"

repo_url=$(sed -nE \
  's|^[[:space:]]*source=\([[:space:]]*"git[+]([^#"]+)#commit=[[:xdigit:]]+"[[:space:]]*\)[[:space:]]*$|\1|p' \
  "$pkgbuild" | sed -n '1p')
current_pkgver=$(sed -nE 's|^pkgver=([^[:space:]]+)$|\1|p' "$pkgbuild" | sed -n '1p')
current_pkgrel=$(sed -nE 's|^pkgrel=([0-9]+)$|\1|p' "$pkgbuild" | sed -n '1p')
current_commit=$(sed -nE \
  's|^[[:space:]]*source=\([[:space:]]*"git[+][^#"]+#commit=([[:xdigit:]]+)"[[:space:]]*\)[[:space:]]*$|\1|p' \
  "$pkgbuild" | sed -n '1p')

[[ -n "$repo_url" ]] || die "could not read the git source URL from PKGBUILD"
[[ -n "$current_pkgver" ]] || die "could not read pkgver from PKGBUILD"
[[ -n "$current_pkgrel" ]] || die "could not read numeric pkgrel from PKGBUILD"
[[ -n "$current_commit" ]] || die "could not read the source commit from PKGBUILD"

tag_data=$(git ls-remote --tags --refs "$repo_url" 'refs/tags/v*')
latest_line=$(printf '%s\n' "$tag_data" | awk '
  $2 ~ /^refs\/tags\/v[0-9]+(\.[0-9]+)+$/ {
    version = $2
    sub(/^refs\/tags\/v/, "", version)
    print version "\t" $1
  }
' | sort -V -k1,1 | tail -n1)

[[ -n "$latest_line" ]] || die "no stable vX.Y.Z tags found at $repo_url"

latest_pkgver=${latest_line%%$'\t'*}
latest_commit=${latest_line#*$'\t'}

if [[ "$current_pkgver" != "$latest_pkgver" ]]; then
  highest_pkgver=$(printf '%s\n' "$current_pkgver" "$latest_pkgver" | sort -V | tail -n1)
  [[ "$highest_pkgver" == "$latest_pkgver" ]] || \
    die "PKGBUILD is newer than upstream ($current_pkgver > $latest_pkgver)"
fi

if [[ "$current_pkgver" == "$latest_pkgver" && "$current_commit" == "$latest_commit" ]]; then
  new_pkgrel=$current_pkgrel
elif [[ "$current_pkgver" == "$latest_pkgver" ]]; then
  new_pkgrel=$((current_pkgrel + 1))
else
  new_pkgrel=1
fi

if [[ "$current_pkgver" != "$latest_pkgver" || "$current_commit" != "$latest_commit" || \
      "$current_pkgrel" != "$new_pkgrel" ]]; then
  sed -E -i \
    -e "s|^pkgver=.*$|pkgver=$latest_pkgver|" \
    -e "s|^pkgrel=.*$|pkgrel=$new_pkgrel|" \
    -e "s|^(source=\(\"git[+][^#\"]+#commit=)[[:xdigit:]]+(\"\))$|\1$latest_commit\2|" \
    "$pkgbuild"
fi

updated_commit=$(sed -nE \
  's|^[[:space:]]*source=\([[:space:]]*"git[+][^#"]+#commit=([[:xdigit:]]+)"[[:space:]]*\)[[:space:]]*$|\1|p' \
  "$pkgbuild" | sed -n '1p')
[[ "$updated_commit" == "$latest_commit" ]] || die "failed to update the source commit"

srcinfo_tmp=$(mktemp "$root/.SRCINFO.XXXXXX")
cleanup() {
  [[ -z "${srcinfo_tmp:-}" ]] || rm -f -- "$srcinfo_tmp"
  [[ -z "${verify_dir:-}" ]] || rm -rf -- "$verify_dir"
}
trap cleanup EXIT

makepkg --printsrcinfo > "$srcinfo_tmp"
if [[ -e "$srcinfo" ]]; then
  chmod --reference="$srcinfo" "$srcinfo_tmp"
fi
mv -f -- "$srcinfo_tmp" "$srcinfo"
srcinfo_tmp=

bash -n "$pkgbuild"
git diff --check -- "$pkgbuild" "$srcinfo"

printf 'Upstream: v%s (%s)\n' "$latest_pkgver" "$latest_commit"
printf 'Package:  %s-%s\n' "$latest_pkgver" "$new_pkgrel"

if ((verify)); then
  verify_dir=$(mktemp -d "${TMPDIR:-/tmp}/upkg.XXXXXX")
  mkdir "$verify_dir/srcdest"
  cp -- "$pkgbuild" "$srcinfo" "$verify_dir/"

  printf 'Verifying source and prepare()...\n'
  (
    cd "$verify_dir"
    SRCDEST="$verify_dir/srcdest" makepkg --nobuild --nodeps --noconfirm
  )

  prepared_setup="$verify_dir/src/pywhispercpp/setup.py"
  grep -Fq 'f"-DPython_EXECUTABLE=/usr/bin/python"' "$prepared_setup" || \
    die 'prepare() did not update the upstream CMake Python interpreter setting'
  printf 'Source and prepare() verification passed.\n'
else
  printf 'Source verification skipped (--no-verify).\n'
fi
