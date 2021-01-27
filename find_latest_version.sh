#!/usr/bin/bash

curl --silent https://storage.googleapis.com/symbiflow-arch-defs-gha/symbiflow-toolchain-latest \
	| sed -E 's.%2F./.g; s#.*/install/([0-9]+)/([0-9-]+)/[^/]+-([0-9a-f]+)\.tar\.xz.*#_buildnum=\1\n_builddate=\2\n_commit=\3\n#'
