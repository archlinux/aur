#!/bin/sh
if [[ -z "${JAVA_HOME}" ]]; then
    JAVA_HOME_DETECTED=$(archlinux-java-run -a 8 -b 8 -j)
    if (( $? == 0 )); then
        export JAVA_HOME=${JAVA_HOME_DETECTED}
    fi
fi
exec /usr/share/openhab2/runtime/bin/karaf "${@}"
