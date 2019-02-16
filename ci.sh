#!/usr/bin/env bash

_ci () {
  TAG_NAME="announced/altogether-aur"
  PKG_PATH="github.com/announce/altogether-aur"
  TAG_VERSION="${TAG_VERSION:=0.0.0}"
  set -e

  init () {
    build-container
  }

  build-container () {
    docker build -t "${TAG_NAME}:${TAG_VERSION}" .
  }

  ci () {
    make lint-yaml
    _ make init lint build install
  }

  _ () {
    docker run --rm --interactive \
      --volume "${PWD}:/home/aur" \
      "${TAG_NAME}:${TAG_VERSION}" "$@"
  }

  _fatal () {
    MESSAGE="${1:-Something went wrong.}"
    echo "[$(basename "$0")] ERROR: ${MESSAGE}" >&2
    exit 1
  }

  version () {
    echo "$(git describe --tags --always --dirty) ($(git name-rev --name-only HEAD))"
  }

  usage () {
    SELF="$(basename "$0")"
    echo -e "
    \\nUsage: ${SELF} [arguments]
    \\nArguments:"
    declare -F | awk '{print "\t" $3}' | grep -Ev $'^\t_'
  }

  if [[ $# = 0 ]]; then
    usage
  elif [[ "$(type -t "$1")" = "function" ]]; then
    $1 "$(shift && echo "$@")"
  else
    _fatal "No such command: $*"
  fi
}

_ci "$@"
