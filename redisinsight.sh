#!/bin/bash

set -euo pipefail

flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/redisinsight-flags.conf"

declare -a redisinsight_flags

if [[ -f "${flags_file}" ]]
then
    mapfile -t < "${flags_file}" REDISINSIGHT_MAP_FILE
fi

for line in "${REDISINSIGHT_MAP_FILE[@]}"
do
    if [[ ! "${line}" =~ ^[[:space:]]*#.* ]]
    then
        redisinsight_flags+=("${line}")
    fi
done

exec /opt/RedisInsight/redisinsight "${redisinsight_flags[@]}" "$@"
