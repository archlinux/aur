if [[ ! -v _engine_version ]]; then
	_engine_version="$(yq -er .environment.flutter 'pubspec.yaml')"

	if [[ -z "$_engine_version" ]]; then
		local _pubspec="$(find "${srcdir}" -path "${srcdir}/flutter" -prune -o -path "${srcdir}/flutter-engine" -prune -o -name 'pubspec.yaml' -print -quit)"
		if [[ -n "$_pubspec" ]]; then
			_engine_version="$(yq -er .environment.flutter "$_pubspec")"
		fi
	fi
fi

if [[ -n "$_engine_version" ]]; then
	git -C "${srcdir}/flutter" checkout -f "$_engine_version"
fi

export PATH="${srcdir}/flutter/bin:$PATH"
