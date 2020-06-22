#!/usr/bin/env bash

set -euo pipefail

url='https://zoom.us/download?os=linux'

printf "Fetching current version... "
curver=$(curl -s "$url" | grep -oP 'Version \K[0-9.]+')
printf "done!\n"

printf "Reading local package version... "
pkgv=$( ( set +u; source PKGBUILD; echo "$pkgver") )
printf "done!\n"

printf "Package version:\t%s\n" "$pkgv"
printf "Latest available:\t%s\n" "$curver"

case $(vercmp "$curver" "$pkgv") in
        0)
                echo "Up to date"
                ;;
        1)
                echo "Newer version available"
                ;;
        -1)
                echo "Local version is newer (??)"
                ;;
        *) 
                echo "Unknown vercmp result"
                ;;
esac

