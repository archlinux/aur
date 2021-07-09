#!/bin/bash
readarray -t DOPPLERTEXT <<<"$(doppler | head -2 | sed -r 's/[[:cntrl:]]\[[0-9]{1,3}m//g')"
TO_CHECK="An update is available."

if [ "${DOPPLERTEXT[0]}" == "$TO_CHECK" ]; then
    NEWVERSION="$(echo "${DOPPLERTEXT[1]}" | grep -Eo '[0-9]\.[0-9]{1,2,3}\.[0-9]{1,2,3}')"
    if [[ $* == *--dry-run* ]]; then
        echo "New version available: $NEWVERSION"
    else
        sed -i "s/pkgver=.*/pkgver=$NEWVERSION/g" PKGBUILD
        echo "Updated version to $NEWVERSION"
    fi
else
    echo "No update available"
fi
