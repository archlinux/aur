#!/usr/bin/sh
# DLAGENT that dispatches a DLAGENT based on which license we're downloading

output="$1"
url="$2"

if [[ "$output" == *"US"* ]]; then
    /usr/bin/sh $PWD/dlagent-license-US.sh "$output" "$url"
else
    /usr/bin/sh $PWD/dlagent-license-global.sh "$output" "$url"
fi
