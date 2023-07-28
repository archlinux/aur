#!/bin/sh

# To debug the tool, you can uncomment the following lines to enable debug
# mode and set an observatory port:
# FLUTTER_TOOL_ARGS="--enable-asserts $FLUTTER_TOOL_ARGS"
# FLUTTER_TOOL_ARGS="$FLUTTER_TOOL_ARGS --observe=65432"

export FLUTTER_ROOT=/opt/flutter
export PATH=${PATH}:${FLUTTER_ROOT}/bin
/bin/dart --disable-dart-dev --packages="$FLUTTER_ROOT/packages/flutter_tools/.dart_tool/package_config.json" $FLUTTER_TOOL_ARGS "$FLUTTER_ROOT/bin/cache/flutter_tools.snapshot" "$@"
