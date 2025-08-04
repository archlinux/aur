#!/bin/bash
args=()
for arg in "$@"; do
  if [[ "$arg" == "-l:libatomic.a" ]]; then
    args+=("-latomic")
  else
    args+=("$arg")
  fi
done

# Call the real gcc with modified arguments
exec gcc "${args[@]}"
