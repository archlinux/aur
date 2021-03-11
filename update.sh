#!/bin/bash

set -x

set -eou pipefail


http https://api.github.com/repos/gruntwork-io/cloud-nuke/releases/latest \
	"Accept: application/vnd.github.v3+json" |
	jq -r '.assets[] | select(.name | test("^(SHA256SUMS|cloud-nuke.*_linux_(amd64|386))$")) | .browser_download_url' |
	xargs -n 1 -P 3 wget

sha256sum --ignore-missing --status -c SHA256SUMS

X86_64_SHA=$(awk '/cloud-nuke.*_linux_amd64$/ {print $1}' SHA256SUMS)

I386_SHA=$(awk '/cloud-nuke.*_linux_386$/ {print $1}' SHA256SUMS)

sed -i -r 's/(sha256sums_x86_64=)\([A-Fa-f0-9]*\)/\1\('"$X86_64_SHA"'\)/g' PKGBUILD

sed -i -r 's/(sha256sums_i386=)\([A-Fa-f0-9]*\)/\1\('"$I386_SHA"'\)/g' PKGBUILD

makepkg --printsrcinfo >.SRCINFO
