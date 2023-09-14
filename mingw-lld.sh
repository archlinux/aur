#!/bin/sh

# lld does not allow --sort-common option, replace it in command files: "lld @/tmp/cc56X55P"
for arg in "$@"
do
   grep -qE "^@" <<< "$arg" && sed -i "s|--sort-common|--as-needed|g" ${arg:1}
done

/usr/bin/ld.lld "$@"
