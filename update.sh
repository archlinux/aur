#!/usr/bin/env sh

srcs="$(./src/coreboot/util/crossgcc/buildgcc -u)"


printf "sources=(\n"

for src in ${srcs}; do
	printf "  '${src}'\n"
done

printf ")\n"
