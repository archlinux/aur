#!/bin/bash
if [[ -z "${INCEPTUM_BASE}" ]]
then
    INCEPTUM_BASE=~/.config/Inceptum
fi
/usr/bin/java "-Dinceptum.base=$INCEPTUM_BASE" -jar /usr/share/java/inceptum/inceptum.jar "$@"
