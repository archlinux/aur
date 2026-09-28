#!/bin/bash
set -e

. /etc/yaycache-hook.conf

# Every *_args setting may be written as an array,
#   uninstalled_extra_args=(--min-mtime "30 days ago" --remove-build-files)
# or as a single string, which is split the way the shell would, so quotes
# inside it are honoured:
#   uninstalled_extra_args="--min-mtime '30 days ago' --remove-build-files"
# The result is left in the global array `_args`.
as_array() {
	local decl
	_args=()
	decl=$(declare -p "$1" 2>/dev/null) || return 0
	if [[ $decl == "declare -a"* ]]; then
		local -n ref=$1
		_args=("${ref[@]}")
	elif [[ -n ${!1} ]]; then
		eval "_args=(${!1})"
	fi
}

# Expand a glob pattern into `_dirs` without splitting on whitespace.
expand_glob() {
	local IFS=
	shopt -s nullglob
	# shellcheck disable=SC2206
	_dirs=($1)
	shopt -u nullglob
}

as_array cache_dirs
cache_dirs=("${_args[@]}")
if (( ${#cache_dirs[@]} == 0 )); then
	# pacman hooks run as root, so yaycache's default cache directory would be
	# root's own ~/.cache/yay. Clean every user's yay cache instead.
	cache_dirs=('/home/*/.cache/yay/*/')
	echo "cache_dirs is empty in /etc/yaycache-hook.conf, using /home/*/.cache/yay/*/"
fi

cache_args=()
for pattern in "${cache_dirs[@]}"; do
	# patterns may be quoted in the config, so expand them here
	expand_glob "$pattern"
	for cdir in "${_dirs[@]}"; do
		cache_args+=(-c "$cdir")
	done
done

if (( ${#cache_args[@]} == 0 )); then
	echo "no yay cache directories found, nothing to clean"
	exit 0
fi

as_array extra_args
extra_args=("${_args[@]}")

if [ "$installed" = "true" ]; then
	echo "Removing old installed AUR packages..."
	as_array installed_extra_args
	if [ -n "$installed_move_to" ]; then
		yaycache "${cache_args[@]}" -m "$installed_move_to" "-k${installed_keep:-2}" "${extra_args[@]}" "${_args[@]}"
	else
		yaycache "${cache_args[@]}" "-rk${installed_keep:-2}" "${extra_args[@]}" "${_args[@]}"
	fi
fi

if [ "$uninstalled" = "true" ]; then
	echo "Removing old uninstalled AUR packages..."
	as_array uninstalled_extra_args
	if [ -n "$uninstalled_move_to" ]; then
		yaycache "${cache_args[@]}" -m "$uninstalled_move_to" "-uk${uninstalled_keep:-1}" "${extra_args[@]}" "${_args[@]}"
	else
		yaycache "${cache_args[@]}" "-ruk${uninstalled_keep:-1}" "${extra_args[@]}" "${_args[@]}"
	fi
fi
