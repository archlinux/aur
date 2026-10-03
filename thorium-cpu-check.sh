#!/usr/bin/env bash

set -euo pipefail

readonly installed_package='thorium-browser-sse4-bin'

cpu_flags() {
	awk '
		/^flags[[:space:]]*:/ {
			line = $0
			sub(/^[^:]*:[[:space:]]*/, "", line)
			count = split(line, current, /[[:space:]]+/)

			delete present
			for (field = 1; field <= count; field++) {
				if (current[field] != "") {
					present[current[field]] = 1
				}
			}

			if (!seen) {
				for (flag in present) {
					common[flag] = 1
				}
				seen = 1
			} else {
				for (flag in common) {
					if (!(flag in present)) {
						delete common[flag]
					}
				}
			}
		}
		END {
			if (!seen) {
				exit 2
			}
			for (flag in common) {
				print flag
			}
		}
	' /proc/cpuinfo
}

has_all_flags() {
	local available=$1
	shift
	local required

	for required in "$@"; do
		grep -qx -- "$required" <<< "$available" || return 1
	done
}

select_x86_64_package() {
	local available=$1

	local -a avx2_flags=(
		pni sse4_1 sse4_2 pclmulqdq aes avx
		avx2 fma
	)
	local -a avx_flags=(
		pni sse4_1 sse4_2 pclmulqdq aes avx
	)
	local -a sse4_flags=(
		pni sse4_1
	)

	if has_all_flags "$available" "${avx2_flags[@]}"; then
		printf '%s\n' 'thorium-browser-avx2-bin'
	elif has_all_flags "$available" "${avx_flags[@]}"; then
		printf '%s\n' 'thorium-browser-avx-bin'
	elif has_all_flags "$available" "${sse4_flags[@]}"; then
		printf '%s\n' 'thorium-browser-sse4-bin'
	elif has_all_flags "$available" pni; then
		printf '%s\n' 'thorium-browser-bin'
	else
		return 1
	fi
}

runtime_arch() {
	local bits
	bits=$(getconf LONG_BIT 2>/dev/null) || return 1

	case $bits in
		64)
			printf '%s\n' 'x86_64'
			;;
		32)
			printf '%s\n' 'i686'
			;;
		*)
			return 1
			;;
	esac
}

show_popup() {
	local message=$1
	local urgency=$2

	printf '%s\n' "$message" >&2

	if [[ -n ${DISPLAY:-} || -n ${WAYLAND_DISPLAY:-} ]]; then
		notify-send --app-name='Thorium Browser' --urgency="${urgency}" \
			'Thorium Browser package warning' "$message" >/dev/null 2>&1 &
	fi
}

mode=${1:-runtime}
if (( $# > 1 )); then
	printf 'Usage: %s [build|runtime]\n' "${0##*/}" >&2
	exit 2
fi

case $mode in
	build|runtime)
		;;
	*)
		printf 'Usage: %s [build|runtime]\n' "${0##*/}" >&2
		exit 2
		;;
esac

if [[ $mode == build && ${THORIUM_PACKAGING_SERVER:-0} == 1 ]]; then
	exit 0
fi

if [[ $mode == build ]]; then
	target_arch=${CARCH:-}
elif target_arch=$(runtime_arch); then
	:
else
	target_arch=''
fi

detected_package=''
if [[ ! -r /proc/cpuinfo ]] || [[ -z $target_arch ]]; then
	detection_status=2
elif [[ $target_arch != x86_64 ]]; then
	detection_status=1
elif available=$(cpu_flags); then
	if detected_package=$(select_x86_64_package "$available"); then
		if has_all_flags "$available" pni sse4_1; then
			detection_status=0
		else
			detection_status=1
		fi
	else
		detection_status=1
	fi
else
	detection_status=2
fi

case $mode in
	build)
		if (( detection_status == 0 )) && [[ $detected_package == "$installed_package" ]]; then
			exit 0
		elif (( detection_status == 0 )); then
			printf 'WARNING: %s is compatible with this CPU; optimized variant %s is also available and may provide better performance.\n' \
				"$installed_package" "$detected_package" >&2
		elif (( detection_status == 1 )) && [[ $detected_package == 'thorium-browser-bin' ]]; then
			printf 'WARNING: %s requires SSE4.1 and SSE3. This CPU can use thorium-browser-bin instead. The package can still be built.\n' \
				"$installed_package" >&2
		elif (( detection_status == 1 )) && [[ $target_arch != x86_64 ]]; then
			printf 'WARNING: %s supports x86_64 only. The package can still be prepared, but it cannot run on this architecture.\n' \
				"$installed_package" >&2
		elif (( detection_status == 1 )); then
			printf 'WARNING: %s requires SSE4.1 and SSE3, which this CPU does not support. The package can be built, but Thorium will not run on this CPU.\n' \
				"$installed_package" >&2
		else
			printf 'WARNING: CPU features or the target architecture could not be determined, so compatibility and the best-performing Thorium package could not be checked.\n' >&2
		fi
		exit 0
		;;
	runtime)
		if (( detection_status == 0 )) && [[ $detected_package == "$installed_package" ]]; then
			exit 0
		elif (( detection_status == 0 )); then
			message="The installed package is ${installed_package}. Optimized variant ${detected_package} also matches this CPU and may provide better performance. It is not necessarily a drop-in replacement; verify its package metadata and command paths before switching."
			urgency='low'
		elif (( detection_status == 1 )) && [[ $detected_package == 'thorium-browser-bin' ]]; then
			message="This CPU does not support SSE4.1, which ${installed_package} requires. The baseline thorium-browser-bin package matches this CPU instead."
			urgency='critical'
		elif (( detection_status == 1 )) && [[ $target_arch != x86_64 ]]; then
			message="${installed_package} supports x86_64 only."
			urgency='critical'
		elif (( detection_status == 1 )); then
			message="This CPU does not support SSE4.1 and SSE3, which ${installed_package} requires."
			urgency='critical'
		else
			message="Thorium Browser cannot determine this system's architecture or CPU instruction support."
			urgency='normal'
		fi
		show_popup "$message" "$urgency"
		exit 0
		;;
esac
