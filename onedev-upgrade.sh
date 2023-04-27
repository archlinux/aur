#!/usr/bin/env bash

set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

usage() {
  cat << EOF # remove the space between << and EOF, this is due to web plugin issue
Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-v] [-r] -s /opt/onedev-base -d /opt/onedev

Upgrades (or creates) a OneDev installation using the official upgrade script.

The OneDev AUR package keeps the latest version of the application in
/opt/onedev-base and uses that to upgrade the live installation at /opt/onedev.
These directories are used by default unless specified via the -s and -d
parameters.

This script will not upgrade the system if the systemd service is running. If
you want to automatically stop and restart the systemd service then pass the -r
flag.

Available options:

-h, --help      Print this help and exit
-v, --verbose   Print script debug info
-s, --source    Source directory containing newer version
-d, --dest      Destination directory to be upgraded
-r, --restart   Stop and restart OneDev if systemd service is active
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
  src_dir='/opt/onedev-base'
  dest_dir='/opt/onedev'
  restart=0

  while :; do
    case "${1-}" in
    -h | --help) usage ;;
    -v | --verbose) set -x ;;
    --no-color) NO_COLOR=1 ;;
    -r | --restart) restart=1 ;;
    -s | --src)
      src_dir="${2-}"
      shift
      ;;
    -d | --dest)
      dest_dir="${2-}"
      shift
      ;;
    -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done

  args=("$@")

  # check required params and arguments
  [[ -z "${src_dir-}" ]] && die "Missing required parameter: source directory"
  [[ -z "${dest_dir-}" ]] && die "Missing required parameter: destination directory"

  return 0
}

upgrade_onedev() {
  "${src_dir}"/bin/upgrade.sh "${dest_dir}"
  chown -R onedev:onedev "${dest_dir}"
}

parse_params "$@"
setup_colors

if [[ ! -d "${src_dir}" ]]; then
  die "${RED}Source directory '${dest_dir}' does not exist, quitting.${NOFORMAT}"
fi

if [[ ! -f "${src_dir}/bin/upgrade.sh" ]]; then
  die "${RED}Cannot find OneDev upgrade script in '${src_dir}/bin', quitting.${NOFORMAT}"
fi

if [[ ! -d "${dest_dir}" ]]; then
  die "${RED}Destination directory '${dest_dir}' does not exist, quitting.${NOFORMAT}"
fi

if [[ ! -w "${dest_dir}" ]]; then
  die "${RED}Cannot write to destination directory '${dest_dir}', quitting.${NOFORMAT}"
fi

if systemctl is-active --quiet onedev.service; then
  if [[ $restart -eq 1 ]]; then
    msg "${YELLOW}Stopping OneDev...${NOFORMAT}"
    systemctl stop onedev.service
    msg "${YELLOW}Upgrading OneDev...${NOFORMAT}"
    upgrade_onedev
    msg "${YELLOW}Restarting OneDev...${NOFORMAT}"
    systemctl start onedev.service
    msg "${GREEN}Finished.${NOFORMAT}"
  else
    die "${RED}OneDev service is currently running, either stop it or pass -r flag.${NOFORMAT}"
  fi
else
  msg "${YELLOW}Upgrading OneDev...${NOFORMAT}"
  upgrade_onedev
fi
