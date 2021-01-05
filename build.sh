#!/bin/bash
set -e

# make all required packages available in pkg-cache, e.g. like this:

# mkdir pkg-cache
# yay -S r-testthat
# mv /tmp/yaytmp-1000/*/*.pkg.tar.xz pkg-cache/

declare -a args
for dep in $(pactree -u r-testthat | grep '^r-'); do
	args+=('-I' "$(ls ./pkg-cache/$dep-*)")
done

extra-x86_64-build -- "${args[@]}"
