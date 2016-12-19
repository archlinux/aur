#!/bin/sh
cd "$(dirname -- "$0")" || exit $?

FILES="$(find . -maxdepth 1 -name 'D200_*.gcode')"
if [ "$(echo "$FILES" |wc -w)" -ne 1 ]
then
    echo >&2 "Error: not a single D200 GCode file"
    exit 1
fi

# Never stop the fan
sed 's/^M107$/M106 S130/' "$FILES" > dagoma.g
echo 'dagoma.g is ready!'
