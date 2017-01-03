#!/bin/bash
stack=(t)

ctest() {
	[[ "${stack[0]}" = "$1" ]]
	return "$?"
}

cpush() {
	stack=("$1" "${stack[@]}")
}

cpop() {
	stack=("${stack[@]:1}")
}

cswap() {
	stack[0]="$1"
}

ceval() {
	local test="$1"
	shift

	local item
	for item in "$@"; do
		if [[ -n "${!item}" ]]; then
			! [[ "$test" = *ndef ]]
			return "$?"
		fi
	done

	[[ "$test" = *ndef ]]
	return "$?"
}

for item in "$@"; do
	eval "$item=1"
done

while IFS=$'\r' read -r line; do
	case "$line" in
		@ifdef*|@ifndef*)
			if ctest t; then
				if ceval $line; then
					cpush t
				else
					cpush w
				fi
			else
				cpush e
			fi
		;;
		@elifdef*|@elifndef*)
			if ctest w; then
				if ceval $line; then
					cswap t
				else
					cswap w
				fi
			else
				cswap e
			fi
		;;
		@else*)
			if ctest w; then
				cswap t
			else
				cswap e
			fi
		;;
		@endif*)
			cpop
		;;
		*)
			if ctest t; then
				echo "$line"
			fi
		;;
	esac
done

exit 0
