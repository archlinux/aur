#!/bin/bash

set -eou pipefail

GITHUB_TOKEN=${GITHUB_TOKEN}

http https://api.github.com/repos/claudiodangelis/qrcp/releases/latest \
	"Accept: application/vnd.github.v3+json" \
	"Authorization: ${GITHUB_TOKEN}" |
	jq -r '.assets[] | select(.name | test("^(checksums.txt|qrcp.*_linux_(x86_64|i386).tar.gz)$")) | .browser_download_url' |
	xargs -n 1 -P 3 wget

sha256sum --ignore-missing --status -c checksums.txt

I386_SHA=$(awk '/qrcp.*_linux_i386.tar.gz$/ {print $1}' checksums.txt)

X86_64_SHA=$(awk '/qrcp.*_linux_x86_64.tar.gz$/ {print $1}' checksums.txt)

sed -i 's/\(sha256sums_x86_64=\)(\d*)/\1'"$X86_64_SHA"'/g' PKGBUILD

sed -i 's/\(sha256sums_i386=\)(\d*)/\1'"$I386_SHA"'/g' PKGBUILD

makepkg --printsrcinfo >.SRCINFO
