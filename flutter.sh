#!/bin/bash
export FLUTTER_ROOT=/opt/flutter
export PATH=${PATH}:${FLUTTER_ROOT}/bin
/bin/dart --disable-dart-dev --packages="$FLUTTER_ROOT/packages/flutter_tools/.dart_tool/package_config.json" $FLUTTER_TOOL_ARGS "$SNAPSHOT_PATH" "$@"
