_engine_path='/opt/flutter-engine'
_engine_version="$(cat "$_engine_path/version")"

git -C "${srcdir}/flutter" checkout -f "$_engine_version"

export PATH="${srcdir}/flutter/bin:$PATH"

local flutter_select_engine=
