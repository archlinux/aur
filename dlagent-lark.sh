#!/bin/bash
# DLAGENT for https: downloads
# Fetches the actual download URL from the API response and downloads the file

output="$1"
url="$2"

download_link=$(curl "$url" | grep -oP '(?<="download_link":")[^"]*' -- | sed 's/\\u0026/\&/g' --)
curl -o "$output" -L "$download_link"
