#! /bin/bash
set -o errexit -o pipefail

if [ -z "$DENO_INSTALL" ]; then
  echo 'ERROR: Environment variable DENO_INSTALL is not defined.' >&2
  echo >&2
  dvm-install-instruction >&2
  exit 1
fi

exec dvm.bin "$@"
