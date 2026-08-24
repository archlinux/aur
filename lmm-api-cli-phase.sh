# shellcheck shell=bash disable=SC2034
# Canonical package metadata/install contract for the unified Go CLI transition.

readonly LMM_CLI_PHASE_T0=t0
readonly LMM_CLI_PHASE_T1=t1
readonly LMM_CLI_T1_RELEASE=0.1.60
# Source, -git, and local recipes follow this explicit repository phase instead
# of comparing their independent rolling pkgver with the binary release train.
readonly LMM_CLI_SOURCE_PHASE=t0

lmm_cli_phase_validate() {
  [[ $1 == "$LMM_CLI_PHASE_T0" || $1 == "$LMM_CLI_PHASE_T1" ]]
}

lmm_cli_phase_for_binary_release() {
  local version=$1
  if (( $(vercmp "$version" "$LMM_CLI_T1_RELEASE") < 0 )); then
    printf '%s\n' "$LMM_CLI_PHASE_T0"
  else
    printf '%s\n' "$LMM_CLI_PHASE_T1"
  fi
}

lmm_cli_phase_apply_metadata() {
  local phase=$1 version=$2
  shift 2
  lmm_cli_phase_validate "$phase" || return 1
  provides=("lmm-api=${version}")
  conflicts=("$@")
  replaces=()
  if [[ $phase == "$LMM_CLI_PHASE_T0" ]]; then
    provides+=("lmm-api-go=${version}")
  else
    conflicts+=('lmm-api-deploy' 'lmm-api-deploy-bin')
    replaces+=('lmm-api-deploy-bin')
  fi
}

lmm_cli_phase_install_compatibility_alias() {
  local phase=$1 pkgdir=$2
  lmm_cli_phase_validate "$phase" || return 1
  if [[ $phase == "$LMM_CLI_PHASE_T0" ]]; then
    [[ ! -e $pkgdir/usr/bin/lmm-api-go && ! -L $pkgdir/usr/bin/lmm-api-go ]] || return 1
    ln -s lmm-api "$pkgdir/usr/bin/lmm-api-go"
  fi
}
