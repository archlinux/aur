#!/bin/bash

#
# Copyright © 2018-2021, Sébastien Luttringer
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

# display what to run and run it quietly
run() {
  echo "==> $*"
  "$@" > /dev/null
  local ret=$?
  (( $ret )) && echo "==> WARNING: \`$*' exited $ret"
  return $ret
}

# check whether the dependencies of a module are installed
# $1: module name
# $2: module version
# $3: kernel version
check_dependency() { (
  source "$source_tree/$1-$2/dkms.conf"
  local mod lines line
  for mod in "${BUILD_DEPENDS[@]}"; do
    mapfile lines < <(dkms status -m "$mod" -k "$3")
    for line in "${lines[@]}"; do
      [[ "$line" =~ "$mod/"[^,]+", $3, "[^:]+': installed' ]] && break 2
    done
    exit 1
  done
  exit 0
) }

# check whether the modules should be built with this kernel version
# $1: module name
# $2: module version
# $3: kernel version
check_buildexclusive() {
  local BUILD_EXCLUSIVE_KERNEL=$(source "$source_tree/$1-$2/dkms.conf"; printf '%s\n' "$BUILD_EXCLUSIVE_KERNEL")
  [[ "$3" =~ $BUILD_EXCLUSIVE_KERNEL ]]
}

# list all kernel versions
all_kver() {
  pushd "$install_tree" >/dev/null
  local path
  for path in */build/; do
    echo "${path%%/*}"
  done
  popd >/dev/null
}

# list all module name/version for a specific kernel version
# $1: kernel version
all_nv_from_kver() {
  local path
  for path in "$source_tree"/*-*/dkms.conf; do
    if [[ -f "$path" && "$path" =~ ^$source_tree/([^/]+)-([^/]+)/dkms\.conf$ ]]; then
      echo "${BASH_REMATCH[1]}/${BASH_REMATCH[2]}"
    fi
  done
}

# list of modules/version for installed/built kernel version
# $1: kernel version
built_nv_from_kver() {
  local line
  dkms status -k "$1" | while read -r line; do
    if [[ "$line" =~ ^([^/]+/[^,]+)", $1, "[^:]+": "(built|installed) ]]; then
      echo "${BASH_REMATCH[1]}"
    fi
  done
}

# list installed or built kernel version for a specific module version
# $1 : module name/module version
built_kver_from_nv() {
  local line
  dkms status "$1" | while read -r line; do
    if [[ "$line" =~ ^"$1, "([^,]+)", "[^:]+": "(built|installed) ]]; then
      echo "${BASH_REMATCH[1]}"
    fi
  done
}

# install registered modules
dkms_install() {
  # list of modules to build for a specific kernel
  local -A tobuild=()

  # add new/updated modules for all kernels to the build list
  local nv kver
  for nv in "${!DKMS_MODULES[@]}"; do
    for kver in $(all_kver); do
      tobuild["$nv/$kver"]=''
    done
  done
  # add modules for new/updated kernels to the build list
  for kver in "${!KERNEL_VERSIONS[@]}"; do
    for nv in $(all_nv_from_kver "$kver"); do
      tobuild["$nv/$kver"]=''
    done
  done

  # list of kver which requires depmod refresh
  local -A depmods=()

  # let's build and install
  local nvk mod mver
  local -i retry=1
  while (( $retry > 0 )); do
    retry=0
    for nvk in "${!tobuild[@]}"; do
      [[ "$nvk" =~ ([^/]+)/([^/]+)/(.+) ]] || continue
      mod="${BASH_REMATCH[1]}"
      mver="${BASH_REMATCH[2]}"
      kver="${BASH_REMATCH[3]}"
      # do not build excluded modules
      if ! check_buildexclusive "$mod" "$mver" "$kver"; then
        unset tobuild[$nvk]
        continue
      # skip modules with missing kernel headers
      elif [[ ! -d "$install_tree/$kver/build/include" ]]; then
        ERROR_MESSAGES+=("Missing $kver kernel headers for module $mod/$mver.")
        unset tobuild[$nvk]
        continue
      # skip modules with missing kernel package
      elif [[ ! -d "$install_tree/$kver/kernel" ]]; then
        ERROR_MESSAGES+=("Missing $kver kernel modules tree for module $mod/$mver.")
        unset tobuild[$nvk]
        continue
      # postpone modules with missing dependencies
      elif ! check_dependency "$mod" "$mver" "$kver"; then
        continue
      fi
      # give it a try dkms
      run dkms install --no-depmod "$mod/$mver" -k "$kver"
      if (( $? == 0 )); then
        # register kernel version for later depmod
        depmods[$kver]=''
      fi
      unset tobuild[$nvk]
      # maybe this module was a dep of another, so we retry
      retry=1
    done
  done
  # run depmod later for performance improvments
  if (( $DKMS_DEPMOD )); then
    for kver in "${!depmods[@]}"; do
      run depmod "$kver"
    done
  fi
  # add errors messages for missing dependencies modules
  for nvk in "${!tobuild[@]}"; do
    [[ "$nvk" =~ ([^/]+/[^/]+)/(.+) ]] || continue
    nv="${BASH_REMATCH[1]}"
    kver="${BASH_REMATCH[2]}"
    ERROR_MESSAGES+=("Missing dependencies to install module $nv for kernel $kver.")
  done
}

# remove registered modules
# run depmod once per kernel for performance improvments
dkms_remove() {
  local nv kver
  local -A depmods=()
  # remove full modules first
  for nv in "${!DKMS_MODULES[@]}"; do
    # try to remove modules one by one to keep the depmod optimization
    for kver in $(built_kver_from_nv "$nv"); do
      run dkms remove --no-depmod "$nv" -k "$kver"
      if (( $? == 0 )); then
        # register kernel version for later depmod
        depmods[$kver]=''
      else
        ERROR_MESSAGES+=("Failed to remove module $nv for kernel $kver.")
      fi
    done
    # ensure module removal (even if only added)
    if [[ $(dkms status "$nv") ]]; then
      run dkms remove "$nv"
      (( $? == 0 )) || ERROR_MESSAGES+=("Failed to remove module $nv.")
    fi
  done
  # remove modules for a specific kernel version
  for kver in "${!KERNEL_VERSIONS[@]}"; do
    for nv in $(built_nv_from_kver "$kver"); do
      run dkms remove --no-depmod "$nv" -k "$kver"
      if (( $? == 0 )); then
        # register kernel version for later depmod
        depmods[$kver]=''
      else
        ERROR_MESSAGES+=("Failed to remove module $nv for kernel $kver.")
      fi
    done
  done
  # run depmod later for performance improvments
  if (( $DKMS_DEPMOD )); then
    for kver in "${!depmods[@]}"; do
      run depmod "$kver"
    done
  fi
}

# display hook usage and exit $1 (default 1)
usage() {
  cat << EOF >&2
usage: ${0##*/} <options> install|remove
options: -D  Do not run depmod
EOF
  exit ${1:-1}
}

# emulated program entry point
main() {
  [[ "$DKMS_ALPM_HOOK_DEBUG" ]] && set -x

  # prevent each dkms call from failing with authorization errors
  if (( EUID )); then
    echo 'You must be root to use this hook' >&2
    return 1
  fi

  # parse command line options
  declare -i DKMS_DEPMOD=1
  local opt
  while getopts 'hD' opt; do
    case $opt in
      D) DKMS_DEPMOD=0;;
      *) usage;;
    esac
  done
  shift $((OPTIND - 1))
  (( $# != 1 )) && usage

  # parse command action to early exit
  case "$1" in
    install|remove) declare -r DKMS_ACTION="$1";;
    *) usage;;
  esac

  # dkms path from framework config
  # note: the alpm hooks which trigger this script use static path
  source_tree='/usr/src'
  install_tree='/usr/lib/modules'
  source /etc/dkms/framework.conf

  # check source_tree and install_tree exists
  local path
  for path in "$source_tree" "$install_tree"; do
    if [[ ! -d "$path" ]]; then
      echo "==> Missing mandatory directory: $path. Exiting!" >&2
      return 1
    fi
  done

  # global storage for changed DKMS modules
  # we use associate arrays to prevent duplication
  # the key is <module name>/<module version>/<kernel version>
  declare -A DKMS_MODULES

  # global storage for changed linux kernels
  # we use associate arrays to prevent duplication
  declare -A KERNEL_VERSIONS

  # global storage for error messages
  declare -a ERROR_MESSAGES

  # parse stdin paths to guess what we should install/remove
  while read -r path; do
    if [[ "/$path" =~ ^$source_tree/([^/]+)-([^/]+)/dkms\.conf$ ]]; then
      # we match file updates on dkms modules sources
      DKMS_MODULES["${BASH_REMATCH[1]}/${BASH_REMATCH[2]}"]=''
    elif [[ "/$path" =~ ^$install_tree/([^/]+)/ ]]; then
      # we match file updates on kernels install/removal
      KERNEL_VERSIONS["${BASH_REMATCH[1]}"]=''
    fi
  done

  dkms_$DKMS_ACTION

  # display errors at the end, to maximize readers
  local msg
  for msg in "${ERROR_MESSAGES[@]}"; do
    echo "==> ERROR: $msg" >&2
  done

  return 0
}

main "$@"
