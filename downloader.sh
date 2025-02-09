#!/bin/bash

DOWNLOAD_URL="$1"
FILE_NAME="$2"
OPERATING_SYSTEMS=("Windows NT 10.0" "Macintosh; Intel Mac OS X 10_15_7" "X11; Ubuntu; Linux x86_64" "Android 10" "iPhone; CPU iPhone OS 14_3 like Mac OS X")
BROWSERS=("Chrome" "Firefox" "Safari" "Edge")

generateUserAgent()
{
    os="${OPERATING_SYSTEMS[$RANDOM % ${#OPERATING_SYSTEMS[@]}]}"
    major=$((RANDOM % 150 + 50))
    minor=$((RANDOM % 200))
    patch=$((RANDOM % 1000))
    version="$major.$minor.$patch"
    browser="${BROWSERS[$RANDOM % ${#BROWSERS[@]}]}"
    case "$browser" in
        "Chrome")
            userAgent="Mozilla/5.0 ($os) AppleWebKit/537.36 (KHTML, like Gecko) $browser/$version Safari/537.36"
            ;;
        "Firefox")
            userAgent="Mozilla/5.0 ($os; rv:$version) Gecko/$version Firefox/$version"
            ;;
        "Safari")
            userAgent="Mozilla/5.0 ($os) AppleWebKit/537.36 (KHTML, like Gecko) Version/$version Safari/537.36"
            ;;
        "Edge")
            userAgent="Mozilla/5.0 ($os) AppleWebKit/537.36 (KHTML, like Gecko) Edge/$version Safari/537.36"
            ;;
    esac
    echo "$userAgent"
}

userAgent=$(generateUserAgent)
userID="$(curl -A "$userAgent" -IsS "${DOWNLOAD_URL%.txz}.md5" | grep -ioP "x-usrid: \K\S+")"
hash=$(base64 -d <<< "$userID" | xxd -ps)
shopt -s extglob
curl -A "$userAgent" -o "$FILE_NAME" "$DOWNLOAD_URL?${hash##+(0)}"
