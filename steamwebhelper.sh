#!/bin/bash
old_arg_0="$1"
shift

DIR="$(dirname "$old_arg_0")"
cd ${DIR}

# Steam runtime 'heavy' is a newer runtime than the default Steam runtime (scout)
# steamwebhelper and libcef.so are built in this newer environment,
# and the needed libraries from heavy are provided here.
# steamwebhelper is compiled to run in the composite runtime made up of heavy+scout(+host)
# See http://repo.steampowered.com/steamrt/steamrt-heavy/ for details

# STEAM_RUNTIME_HEAVY is a debug tool that can be used in the same way as STEAM_RUNTIME in steam.sh,
# to override the location of the heavy runtime libraries

if [ -z "$STEAM_RUNTIME_HEAVY" ]; then
    export STEAM_RUNTIME_HEAVY=./steam-runtime-heavy
fi
echo "STEAM_RUNTIME_HEAVY: ${STEAM_RUNTIME_HEAVY}"

export LD_LIBRARY_PATH=".:${STEAM_RUNTIME_HEAVY}:${LD_LIBRARY_PATH}:${DIR}"

# Give precedence to system libraries when running in native mode
if [[ "${STEAM_RUNTIME}" = "0" && -n "${SYSTEM_LD_LIBRARY_PATH}" ]]; then
	export LD_LIBRARY_PATH="/usr/lib:/usr/lib32:${LD_LIBRARY_PATH}"
fi

./steamwebhelper "$@"
