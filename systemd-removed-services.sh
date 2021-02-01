#!/bin/bash

echo
cat | while read -r f; do 
    service="${f##*/}"
    if [ "${f/*\/system\/*/system}" = 'system' ] && systemctl --quiet is-enabled "$service" 2> /dev/null; then
        echo " ► systemctl disable $service"
    elif [ "${f/*\/user\/*/user}" = 'user' ] && systemctl --quiet --global is-enabled "$service" 2> /dev/null; then
        echo " ► systemctl disable --global $service"
    fi
done
