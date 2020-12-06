#!/bin/sh
if [[ -z "${JAVA_HOME}" ]]; then
    JAVA_HOME_DETECTED=$(archlinux-java-run --min 11 --max 11 --java-home)
    if (( $? == 0 )); then
        export JAVA_HOME=${JAVA_HOME_DETECTED}
    fi
fi
exec /usr/share/openhab3/runtime/bin/karaf "${@}"
