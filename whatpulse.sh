#!/bin/bash
declare -a args

until (($# == 0)); do
	if [[ $1 =~ ^-[^-] ]]; then
		args+=("-$1")
	else
		args+=("$1")
	fi
	shift
done

exec -a "$0" /usr/lib/whatpulse/whatpulse "${args[@]}"
