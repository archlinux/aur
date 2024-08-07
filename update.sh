#! /bin/bash

decodeURL() { printf "%b\n" "$(sed 's/+/ /g; s/%\([0-9a-f][0-9a-f]\)/\\x\1/gi;')"; }
# find every hex-encoded character, and decode to ascii

set -eu
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

newver=$(decodeURL <<< $(curl -sI 'https://www.zotero.org/download/client/dl?platform=linux-x86_64&channel=beta' | grep "^location" | sed -E "s/.*beta\/(.*)\/.*/\1/g"))
# decodeURL <<< curl -onlyheaders latest | get redirect location | pick the version

echo $newver

sed "s/^_pkgver.*/_pkgver=$newver/" -i PKGBUILD
# replace the old pkg version with the new version

updpkgsums
makepkg --printsrcinfo > .SRCINFO

git add -A
git commit -m "Auto-update to $newver"
git push

