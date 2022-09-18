#!/usr/bin/env bash

main() {

	yes | sudo pacman -Syu devtools
	extra-x86_64-build -c && rm *.log
	mapfile -t code_pkgs <<< `find . -type f -name 'code-translucent-*.pkg.tar.zst' | sort -Vr`
	sudo pacman -U "${code_pkgs[0]}"

}

main "$@"