#!/bin/sh
if [[ -z "${JAVA_HOME}" ]]; then
    JAVA_HOME_DETECTED=$(archlinux-java-run --min 21 --max 21 --java-home)
    if (( $? == 0 )); then
        export JAVA_HOME=${JAVA_HOME_DETECTED}
    fi
fi
exec /usr/share/openhab5/runtime/bin/karaf "${@}"
