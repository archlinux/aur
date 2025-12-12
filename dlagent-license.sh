#!/bin/bash
# DLAGENT for http: downloads
# Downloads and modifies abUuid and countryCode values

output="$1"
url="$2"

curl -L "$url" | \
  sed 's/abUuid":"[^"]*/abUuid":"418/' | \
  sed 's/countryCode":"[^"]*/countryCode":"LI/' | \
  sed 's/abVersionID":"[^"]*/abVersionID":"999/' > "$output"
