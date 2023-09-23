_engine_path='/opt/flutter-engine'
_dart_sdk="$_engine_path/out/host_arch_release/dart-sdk"
_engine_version="$(cat "$_engine_path/version")"

_ln() { rm -rf "$2" && ln -sf "$1" "$2"; }

git -C "${srcdir}/flutter-engine" checkout -f "$_engine_version"
git -C "${srcdir}/flutter" checkout -f "$_engine_version"

sed -i 's|"$FLUTTER_ROOT/bin/internal/update_dart_sdk.sh"|#|' 'flutter/bin/internal/shared.sh'
sed -i -E 's|_wait_for_lock$|#_wait_for_lock|' 'flutter/bin/internal/shared.sh'
rm -rf "${srcdir}/flutter/bin/cache/dart-sdk" || true
mkdir -p "${srcdir}/flutter/bin/cache"
_ln "$_dart_sdk" "${srcdir}/flutter/bin/cache/dart-sdk"

(cat << EOF
#!/usr/bin/env sh

$_dart_sdk/bin/dart "\$@"
EOF
) > "${srcdir}/flutter/bin/dart"

_ln "$_engine_path/out" "${srcdir}/flutter-engine/out"

export PATH="${srcdir}/flutter/bin:$PATH"
dart --disable-analytics
flutter --disable-telemetry
export FLUTTER_ENGINE="${srcdir}/flutter-engine"

local flutter_select_engine='--local-engine=arch_release'
