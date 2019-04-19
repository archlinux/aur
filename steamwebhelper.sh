#!/bin/bash
old_arg_0="$1"
shift

DIR="$(dirname "$old_arg_0")"
cd ${DIR}
export LD_LIBRARY_PATH=".:${LD_LIBRARY_PATH}:${DIR}"
export SYSTEM_LD_LIBRARY_PATH="/usr/lib:/usr/lib32"

# Give precedence to system libraries when running in native mode
if [[ "${STEAM_RUNTIME}" = "0" && -n "${SYSTEM_LD_LIBRARY_PATH}" ]]; then
	export LD_LIBRARY_PATH="${SYSTEM_LD_LIBRARY_PATH:-}:${LD_LIBRARY_PATH}"
fi
./steamwebhelper "$@"
