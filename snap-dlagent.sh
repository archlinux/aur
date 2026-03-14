#!/usr/bin/env bash
# Download agent for snap:// URLs.
# Resolves the latest stable amd64 snap and downloads it.
url="${1}"
output="${2}"

api_url="https://${url#snap://}"

resolved_url=$(curl -sSL -H 'Snap-Device-Series: 16' "${api_url}" \
  | jq -r '.["channel-map"][]
      | select(.channel.architecture=="amd64"
           and .channel.risk=="stable"
           and .channel.track=="latest")
      | .download.url')

echo "Downloading snap: ${resolved_url}"
curl -L -C - "${resolved_url}" -o "${output}"
