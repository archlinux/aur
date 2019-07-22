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

# Steam client update on June 13 2019 moved the steamrt:heavy libraries into a steam-runtime-heavy/ folder
# Unfortunately the update process left the old libraries in the current folder
# We need to keep the current folder in LD_LIBRARY_PATH for some non steamrt:heavy libs,
# but we don't want these old libraries to cause problems .. so remove them here.
# We will disable this code once we are confident the vast majority of users no longer have these libraries.
rm -f libatk-1.0.so.0
rm -f libatk-bridge-2.0.so.0
rm -f libatspi.so.0
rm -f libdatrie.so.1
rm -f libgio-2.0.so.0
rm -f libglib-2.0.so.0
rm -f libgobject-2.0.so.0
rm -f libgraphite2.so.3
rm -f libharfbuzz.so.0
rm -f libpango-1.0.so.0
rm -f libpangocairo-1.0.so.0
rm -f libpangoft2-1.0.so.0
rm -f libthai.so.0

export LD_LIBRARY_PATH=".:${STEAM_RUNTIME_HEAVY}:${LD_LIBRARY_PATH}:${DIR}"

# Give precedence to system libraries when running in native mode
if [[ "${STEAM_RUNTIME}" = "0" ]]; then
	export LD_LIBRARY_PATH="/usr/lib:/usr/lib32:${LD_LIBRARY_PATH}"
fi

./steamwebhelper "$@"
