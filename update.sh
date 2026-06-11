#!/usr/bin/env bash
set -euo pipefail

repo='h4ckf0r0day/obscura'
pkgbuild='PKGBUILD'
commit=0
push=0

usage() {
  cat <<'EOF'
Usage: ./update.sh [--commit] [--push]

Updates PKGBUILD and .SRCINFO to the latest GitHub release.

Options:
  --commit  Commit the update if files changed.
  --push    Commit and push the update to AUR.
EOF
}

for arg in "$@"; do
  case "$arg" in
    --commit)
      commit=1
      ;;
    --push)
      commit=1
      push=1
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      usage >&2
      exit 2
      ;;
  esac
done

if ! command -v jq >/dev/null 2>&1; then
  printf 'error: jq is required\n' >&2
  exit 1
fi

release_json="$(curl -fsSL "https://api.github.com/repos/${repo}/releases/latest")"
tag="$(jq -r '.tag_name' <<<"${release_json}")"
version="${tag#v}"

if [[ -z "${version}" || "${version}" == "${tag}" ]]; then
  printf 'error: unexpected release tag: %s\n' "${tag}" >&2
  exit 1
fi

tmpdir="$(mktemp -d)"
trap 'rm -rf "${tmpdir}"' EXIT

download() {
  local url="$1"
  local output="$2"

  curl -fL --retry 3 --retry-delay 2 -o "${output}" "${url}"
}

license_url="https://github.com/${repo}/raw/v${version}/LICENSE"
x86_64_url="https://github.com/${repo}/releases/download/v${version}/obscura-x86_64-linux.tar.gz"
aarch64_url="https://github.com/${repo}/releases/download/v${version}/obscura-aarch64-linux.tar.gz"

download "${license_url}" "${tmpdir}/LICENSE-${version}"
download "${x86_64_url}" "${tmpdir}/obscura-${version}-x86_64-linux.tar.gz"
download "${aarch64_url}" "${tmpdir}/obscura-${version}-aarch64-linux.tar.gz"

license_sha="$(sha256sum "${tmpdir}/LICENSE-${version}" | awk '{print $1}')"
x86_64_sha="$(sha256sum "${tmpdir}/obscura-${version}-x86_64-linux.tar.gz" | awk '{print $1}')"
aarch64_sha="$(sha256sum "${tmpdir}/obscura-${version}-aarch64-linux.tar.gz" | awk '{print $1}')"

sed -i -E \
  -e "s/^pkgver=.*/pkgver=${version}/" \
  -e "s/^sha256sums=\\('[0-9a-f]+'\\)/sha256sums=('${license_sha}')/" \
  -e "s/^sha256sums_x86_64=\\('[0-9a-f]+'\\)/sha256sums_x86_64=('${x86_64_sha}')/" \
  -e "s/^sha256sums_aarch64=\\('[0-9a-f]+'\\)/sha256sums_aarch64=('${aarch64_sha}')/" \
  "${pkgbuild}"

makepkg --printsrcinfo > .SRCINFO
makepkg --verifysource

if git diff --quiet -- "${pkgbuild}" .SRCINFO; then
  printf 'Already current: %s\n' "${version}"
  exit 0
fi

printf 'Updated to %s\n' "${version}"

if (( commit )); then
  git add "${pkgbuild}" .SRCINFO
  git commit -m "Update to ${version}"
fi

if (( push )); then
  git push origin master
fi
