#!/usr/bin/env bash
set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

usage() {
  cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [-h] -v version

Updates the OneDev PKGBUILD using the latest or specfic version

Available options:

-h, --help      Print this help and exit
-v, --version   Update PKGBUILD to specified OneDev version
EOF
  exit
}

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
  # script cleanup here
}

setup_colors() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
  else
    NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
  fi
}

msg() {
  echo >&2 -e "${1-}"
}

die() {
  local msg=$1
  local code=${2-1} # default exit status 1
  msg "$msg"
  exit "$code"
}

parse_params() {
  # default values of variables set from params
  version=''

  while :; do
    case "${1-}" in
    -h | --help) usage ;;
    -v | --version) # example named parameter
      version="${2-}"
      shift
      ;;
    -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done

  args=("$@")

  return 0
}

parse_params "$@"
setup_colors

if [[ -z "$version" ]]; then
  msg "${BLUE}Getting build info for latest version...${NOFORMAT}"
  build_api_query="\"Project\" is \"onedev/server\""
else
  msg "${BLUE}Getting build info for version ${version}...${NOFORMAT}"
  build_api_query="\"Project\" is \"onedev/server\" and \"Version\" is \"${version}\""
fi
build_info=$(curl --silent --get https://code.onedev.io/~api/builds --data-urlencode query="${build_api_query}" --data-urlencode offset=0 --data-urlencode count=1)
build_version=$(echo "${build_info}" | jq -r '.[0].version')
build_number=$(echo "${build_info}" | jq -r '.[0].number')
if [[ "${build_version}" == "null" || "${build_number}" == "null" ]]; then
  die "${RED}Could not find a build for version ${version}. Exiting.${NOFORMAT}"
fi
build_md5=$(curl --silent --get https://code.onedev.io/~downloads/projects/160/builds/${build_number}/artifacts/onedev-${build_version}.tar.gz.sha256 | awk '{print $1}')
msg "${BLUE}Identified release ID ${build_number} for version ${build_version}${NOFORMAT}"
msg "${BLUE}Updating PKGBUILD and .SRCINFO...${NOFORMAT}"
sed -i "s/pkgver=.*/pkgver=${build_version}/" PKGBUILD
sed -i "s/_buildid=.*/_buildid=${build_number}/" PKGBUILD
sed -i "s/sha256sums=.*/sha256sums=('${build_md5}'/" PKGBUILD
makepkg --printsrcinfo > .SRCINFO
if ! git diff --exit-code PKGBUILD; then
  msg "${BLUE}Creating git commit...${NOFORMAT}"
  git add PKGBUILD .SRCINFO
  git commit -m "Bump to version ${build_version}"
fi
