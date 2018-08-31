#!/bin/bash
set -euxo pipefail

VER=$(awk -F '=' '/^pkgver/{ print $2 }' PKGBUILD)

# Use ZIP to fetch shasums as git repo is huge
curl -sSfL https://github.com/ryanoasis/nerd-fonts/archive/v${VER}.tar.gz | tar -xvz --wildcards 'nerd-fonts-*/patched-fonts/DejaVuSansMono/*'

function cleanup() {
  rm -rf \
    nerd-fonts-*/ \
    .source.tmp \
    .hash512sum.tmp
}
trap cleanup EXIT

IFS=$'\n'
for file in $(find nerd-fonts-* -name '*.ttf' ! -name '*Windows*'); do

  urlpart=$(echo "$file" | sed 's/^.*DejaVuSansMono//;s/ /%20/g')
  sanitized=$(basename "$file" | sed 's/ /-/g')
  hashsum=$(sha512sum $file | cut -d ' ' -f 1)

  echo "  \"${sanitized}::\${raw_url}${urlpart}\"" >>.source.tmp
  echo "  '${hashsum}'" >>.hash512sum.tmp

done

set +x

echo "source=("
cat .source.tmp
echo -e ")\nsha512sums=("
cat .hash512sum.tmp
echo ")"
