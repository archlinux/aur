#!/bin/sh

set -eu ${TRACE+-x}

PREFIX=/usr/share/dogelog

# If backend isn't specified try to guess it, based on what's installed
if [ "${DOGELOG_BACKEND-}" = '' ]
then
    case "$(ls $PREFIX/dogelog.*)" in
        *.mjs) DOGELOG_BACKEND=node ;;
        *.py)  DOGELOG_BACKEND=python ;;
        *.zip) DOGELOG_BACKEND=java ;;
        *)
            echo Please install dogelog >&2
            exit 1 ;;
    esac
fi

# Select command line appropriate to the backend
case "${DOGELOG_BACKEND}" in
    node*|js|javascript)
        CMDLINE="node $PREFIX/dogelog.mjs"
        ;;
    py*)
        CMDLINE="python3 $PREFIX/dogelog.py"
        ;;
    java*)
        CMDLINE="java -cp $PREFIX/dogelog.zip:playerj/canned Index"
        ;;
    *)
        cat <<-EOT >&2
			DOGELOG_BACKEND must be undefined or be one of: node, python or java
			Current value is: $DOGELOG_BACKEND
		EOT
        exit 1 ;;
esac

exec $CMDLINE "$@"
