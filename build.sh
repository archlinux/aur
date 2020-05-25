#!/bin/bash
set -e

# yay -S r-testthat
# mv /tmp/yaytmp-1000/*/*.pkg.tar.xz .cache/yay/

declare -a args
for dep in $(pactree -u r-testthat | grep '^r-'); do
	args+=('-I' "$(ls ~/.cache/yay/$dep-*)")
done

extra-x86_64-build -- "${args[@]}"
