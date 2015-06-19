#!/bin/bash
arguments=("$@")

for ((i = 0; i < ${#arguments[@]}; ++i)); do
	if [ -f "${arguments[$i]}" ] && [[ "${arguments[$i]}" == /* ]]; then
		arguments[$i]="file://${arguments[$i]}"
	fi
done

exec /usr/bin/mono /usr/share/keepass/KPScript.exe "${arguments[@]}"
