#!/bin/sh
if test "$1" == ""; then
    echo "Missing demofile. Please, specify a demofile and try again"
    exit 1
fi

glslhacker /demofile="$(realpath $1)"
