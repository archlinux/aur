#!/bin/sh

if command -v bertini-parallel >/dev/null 2>&1; then
    bertini-parallel "$@"
else
    bertini-serial "$@"
fi
