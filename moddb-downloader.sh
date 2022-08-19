# An script to download from ModDB

url="${1}"
output="${2}"
resolved_url=$(curl --silent https://${url#moddb://} | grep -Po '(?<=href="/)[^"]*' | head -1)

echo "Downloading ${output}"
curl -L -C - "https://www.moddb.com/${resolved_url}" -o \
  "${output}"
