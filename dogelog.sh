#!/bin/sh

set -eu ${TRACE+-x}

PREFIX=/usr/share/dogelog

guess_backend() {
    if [ -f  "$PREFIX/dogelog.mjs" ]; then
        if command -v node >/dev/null 2>&1; then
            echo node; return
        elif command -v bun >/dev/null 2>&1; then
            echo bun; return
        fi
    fi
    if [ -f "$PREFIX/dogelog.py" ]; then
        if command -v pypy3 >/dev/null 2>&1; then
            echo pypy3; return
        elif command -v python3 >/dev/null 2>&1; then
            echo python3
        fi
    fi
    if [ -f "$PREFIX/dogelog.zip" ]; then
        if command -v java >/dev/null 2>&1; then
            echo java; return
        fi
    fi
    echo Please install dogelog >&2
    return 1
}

# If backend isn't specified try to guess it, based on what's installed
if [ "${DOGELOG_BACKEND-}" = '' ]; then
    DOGELOG_BACKEND="$(guess_backend)"
fi

# Select command line appropriate to the backend
case "${DOGELOG_BACKEND}" in
    node*)
        CMDLINE="node $PREFIX/dogelog.mjs" ;;
    bun*)
        CMDLINE="bun $PREFIX/dogelog.mjs" ;;
    python*)
        CMDLINE="python3 $PREFIX/dogelog.py" ;;
    pypy*)
        CMDLINE="pypy3 $PREFIX/dogelog.py" ;;
    java*)
        CMDLINE="java -cp $PREFIX/dogelog.zip:playerj/canned Index"
        ;;
    *)
        cat <<-EOT >&2
			DOGELOG_BACKEND must be undefined or be one of: node, bun, python, pypy or java
			Current value is: $DOGELOG_BACKEND
		EOT
        exit 1 ;;
esac

exec $CMDLINE "$@"
