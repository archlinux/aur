#!/bin/env bash

set -e

SCRIPT_NAME="$(basename "$0")"
REPOSITORY="k8sgpt-ai/k8sgpt"
CLONE_DESTINATION="${PWD}/k8sgpt"
NC="\e[0m"
BOLD="\e[1m"
DIM="\e[2m"
Y="\e[33m"
R="\e[31m"
G="\e[32m"
B="\e[34m"

die() {
  >&2 echo -e "${R}ERROR: $*${NC}"
  exit 1
}

needs_arg() {
  if test -z "$OPTARG"; then
    die "no argument given to --${OPT} option"
  fi
}

usage() {
  echo
  echo -e "${BOLD}Release new AUR version of package.${NC}"
  echo
  echo -e "${B}Usage:${NC}"
  echo "    $SCRIPT_NAME [OPTION]..."
  echo
  echo -e "${B}Options:${NC}"
  echo "    -c, --commit     Autocommit and push to release repository"
  echo "    -m, --mode       Set cloning method (allowed values: https, ssh)"
  echo -e "${DIM}                     Default: ssh${NC}"
  echo "    -v, --version    Release from given version"
  echo -e "${DIM}                     Default: latest release${NC}"
  echo "    -h, --help       Show this help message"
  exit 0
}

function clone() {
  local fetch_url

  case "${fetch_mode}" in
    https ) fetch_url="https://github.com/${REPOSITORY}.git" ;;
    * )     fetch_url="git@github.com:${REPOSITORY}.git" ;;
  esac

  echo -e "${DIM}Cloning bare repository from ${fetch_url}...${NC}"
  git clone -q --bare "${fetch_url}" "${CLONE_DESTINATION}"
}

function get_commit_id() {
  local tags

  tags=$(git -C "${CLONE_DESTINATION}" tag -l --sort=v:refname)

  if test -z "${release}"; then
    release=$(echo "$tags" | tail -n1)
    echo -e "${DIM}Defaulting to latest release (${release})...${NC}"
  else
    local is_release_valid="false"

    for tag in $tags; do
      if test "${release}" == "${tag}"; then
        is_release_valid="true"
        break
      fi
    done

    if test "${is_release_valid}" = "false"; then
      die "invalid version provided (${release})."
    else
      echo -e "${DIM}Using requested release (${release})...${NC}"
    fi
  fi

  commit_id=$(git -C "${CLONE_DESTINATION}" rev-list -n1 "${release}")
}

function update_pkgbuild() {
  echo -e "${DIM}Updating PKGBUILD...${NC}"

  if ! sed -i.orig 's/^\(pkgver=\).*$/\1'"${release}"'/' PKGBUILD; then
    rm -f PKGBUILD
    mv PKGBUILD.orig PKGBUILD
    clean
    die "failed to write package version to PKGBUILD."
  fi

  if ! sed -i.orig 's/^\(.*commit=\).*$/\1'"${commit_id}"'")/' PKGBUILD; then
    rm -f PKGBUILD
    mv PKGBUILD.orig PKGBUILD
    clean
    die "failed to write source commit id to PKGBUILD."
  fi

  rm -f PKGBUILD.orig
}

function make_package() {
  rm -rf "${CLONE_DESTINATION}"
  makepkg -cCs
  makepkg --printsrcinfo > .SRCINFO
}

function auto_commit() {
  if test "${autocommit}" = "true"; then
    git add .SRCINFO PKGBUILD
    git commit -m "chore(release): ${release}"
  fi
}

function clean() {
  rm "${CLONE_DESTINATION}" -rf
  rm ./*.tar.zst -f
}

function main() {
  if ! command -v git &>/dev/null; then
    die "git command is not available."
  fi

  if test -n "${release}" && ! [[ "${release:0:1}" == v ]]; then
    release="v$release"
  fi

  clone
  get_commit_id
  update_pkgbuild
  make_package
  auto_commit
  clean

  echo -e "${G}Release was successful.${NC}"

  if test "${autocommit}" = "false"; then
    echo -e "${Y}Do not forget to commit changes: git commit -m 'chore(release): ${release}'"
  fi
}

autocommit="false"
fetch_mode="ssh"

while getopts 'cm:v:h-:' OPT; do
  # support long options: https://stackoverflow.com/a/28466267/519360
  if test "$OPT" = "-"; then # long option: reformulate OPT and OPTARG
    OPT="${OPTARG%%=*}" # extract long option name
    # shellcheck disable=SC2295
    OPTARG="${OPTARG#$OPT}" # extract long option argument (may be empty)
    OPTARG="${OPTARG#=}" # if long option argument, remove assigning `=`
  fi

  case "$OPT" in
    c | commit )  autocommit="true" ;;
    m | mode )    fetch_mode="${OPTARG}" ;;
    v | version ) release="${OPTARG}" ;;
    h | help )    usage ;;
    ??* )         die "illegal option --${OPT}" ;; # bad long option
    ? )           exit 1 ;; # bad short option (error reported via getopts)
  esac
done

shift $((OPTIND-1)) # remove parsed options and args from $@ list
main
