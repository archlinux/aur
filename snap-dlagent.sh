# An script to download from ModDB
url="${1}"
output="${2}"
resolved_url=$(curl -H 'Snap-Device-Series: 16' https://${url#snap://} | jq '."channel-map"' | jq '.[]' | jq '[."download"."url"]' | grep -m1 https | tr -d ' ' | tr -d '"')

echo "Downloading ${output}"
curl -L -C - "${resolved_url}" -o \
  "${output}"
