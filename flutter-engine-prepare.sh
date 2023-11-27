readonly _engine_path='/opt/flutter-engine'
readonly _dart_sdk="$_engine_path/out/host_arch_release/dart-sdk"
readonly _engine_version="$(cat "$_engine_path/version")"

_ln() { rm -rf "$2" && ln -sf "$1" "$2"; }

git -C "${srcdir}/flutter-engine" checkout -f "$_engine_version"
git -C "${srcdir}/flutter" checkout -f "$_engine_version"

sed -i 's|"$FLUTTER_ROOT/bin/internal/update_dart_sdk.sh"|#|' "${srcdir}/flutter/bin/internal/shared.sh"
sed -i -E 's|_wait_for_lock$|#_wait_for_lock|' "${srcdir}/flutter/bin/internal/shared.sh"
sed -i 's|--no-enable-mirrors "$SCRIPT_PATH"|--no-enable-mirrors "$SCRIPT_PATH" $ARCH_FLUTTER_OPTS|' \
	"${srcdir}/flutter/bin/internal/shared.sh"
sed -i 's|exec "$DART" --disable-dart-dev --packages="$FLUTTER_TOOLS_DIR/.dart_tool/package_config.json" $FLUTTER_TOOL_ARGS "$SNAPSHOT_PATH" "$@"|exec "$DART" --disable-dart-dev --packages="$FLUTTER_TOOLS_DIR/.dart_tool/package_config.json" $FLUTTER_TOOL_ARGS "$SNAPSHOT_PATH" $ARCH_FLUTTER_OPTS "$@"|' \
	"${srcdir}/flutter/bin/internal/shared.sh"
rm -rf "${srcdir}/flutter/bin/cache/dart-sdk" || true
mkdir -p "${srcdir}/flutter/bin/cache"
_ln "$_dart_sdk" "${srcdir}/flutter/bin/cache/dart-sdk"

install -Dm755 <(cat << EOF
#!/usr/bin/env sh

$_dart_sdk/bin/dart "\$@"
EOF
) "${srcdir}/flutter/bin/dart"

_ln "$_engine_path/out" "${srcdir}/flutter-engine/out"

export PATH="${srcdir}/flutter/bin:$PATH"
export FLUTTER_ENGINE="${srcdir}/flutter-engine"
export ARCH_FLUTTER_OPTS='--local-engine=arch_release --no-version-check --suppress-analytics'
