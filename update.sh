#!/usr/bin/bash

# Automatically update to a new version.
# Set the new version and release numbers in PKGBUILD, then run this script,
# using a proxy (by setting libcurl env) if necessary.

# For future maintainers:
# `sed` does not support non-greedy matching, therefore `sd` is used in this script.

set -e

update_sums () {
  local SUFFIX="$1"
  local SRC_NAME="source$SUFFIX"
  local SUM_NAME="sha512sums$SUFFIX"

  if [[ "$2" == "sl" ]]; then
    local SINGLE_LINE="true"
  else
    local SINGLE_LINE="false"
  fi

  echo "Updating $SUM_NAME:"
  echo "-----"

  local SUMS=()
  for SRC_RAW in $(eval echo \${$SRC_NAME[@]}); do
    local SRC_URL=$(echo $SRC_RAW | sed -E 's/.+::(.+)/\1/g')
    local SRC_SUM=$(curl -sL "$SRC_URL" | sha512sum | cut -d " " -f 1)
    SUMS+=("'$SRC_SUM'")

    echo -e "Sum of <$SRC_URL>:\n\t$SRC_SUM"
  done

  echo "-----"
  if [[ "$SINGLE_LINE" == "true" ]]; then
    local SUMS_STR="$SUM_NAME=(${SUMS[@]})"
  else
    local SUMS_STR="$SUM_NAME=(\n$(printf "    %s\n" "${SUMS[@]}")\n)"
  fi
  echo "String written to PKGBUILD:"
  echo -e "$SUMS_STR"
  echo "--------------------"

  sd --flags cs "$SUM_NAME=\(.*?\)" "$SUMS_STR" PKGBUILD
}

source ./PKGBUILD

update_sums ""
update_sums "_x86_64" sl
update_sums "_arm" sl
update_sums "_aarch64" sl

makepkg --printsrcinfo > .SRCINFO
echo "Updated PKGBUILD and .SRCINFO successfully."
