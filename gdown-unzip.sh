# gdown-unzip.sh
#!/usr/bin/env bash
set -euo pipefail

url="$1"          # full URL (gdown://ID)
out="$2"          # target filename (%o)

# download
id="${url#gdown://}"
/usr/bin/gdown "$id" -O "$out"

# unzip
tmp=$(mktemp -d)
unzip -qq "$out" -d "$tmp"

# extract .deb and replace the zip file
deb=$(find "$tmp" -maxdepth 1 -type f -name '*.deb' -print -quit)
if [[ -z $deb ]]; then
    echo "ERROR: No .deb found" >&2
    exit 1
fi
mv -f "$deb" "$out"
rm -rf "$tmp"
