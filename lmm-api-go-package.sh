# shellcheck shell=bash disable=SC2034
# Canonical package metadata and payload ownership for Go provider packages.

readonly LMM_GO_PROVIDER_EXECUTABLE=lmm-api-go
readonly LMM_GO_VERIFIED_LEGACY_PACKAGE=lmm-api-go-bin
readonly LMM_GO_VERIFIED_LEGACY_VERSION=0.1.69

lmm_go_package_is_verified_legacy() {
  [[ $1 == "$LMM_GO_VERIFIED_LEGACY_PACKAGE" && $2 == "$LMM_GO_VERIFIED_LEGACY_VERSION" ]]
}

lmm_go_package_apply_metadata() {
  local version=$1 current_package=$2
  shift 2
  local variant

  if lmm_go_package_is_verified_legacy "$current_package" "$version"; then
    provides=("lmm-api=${version}" "lmm-api-go=${version}" 'lmm-api-provider')
    conflicts=('lmm-api' 'lmm-api-bin' 'lmm-api-git' 'lmm-api-go' 'lmm-api-go-git')
    replaces=()
    return 0
  fi

  provides=("lmm-api-go=${version}" 'lmm-api-provider')
  conflicts=()
  replaces=()
  for variant in "$@"; do
    [[ $variant == lmm-api-go || $variant == lmm-api-go-bin || $variant == lmm-api-go-git ]] || return 1
    [[ $variant == "$current_package" ]] || conflicts+=("$variant")
  done
}

lmm_go_package_assert_payload() {
  local pkgdir=$1 current_package=$2 version=$3
  local provider="$pkgdir/usr/bin/$LMM_GO_PROVIDER_EXECUTABLE"
  local generic="$pkgdir/usr/bin/lmm-api"

  if lmm_go_package_is_verified_legacy "$current_package" "$version"; then
    [[ -f $generic && ! -L $generic && -x $generic ]] || return 1
    [[ -L $provider && $(readlink -- "$provider") == lmm-api ]] || return 1
    return 0
  fi

  [[ -f $provider && ! -L $provider && -x $provider ]] || return 1
  [[ ! -e $generic && ! -L $generic ]] || return 1
}
