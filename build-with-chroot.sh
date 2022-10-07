#!/usr/bin/env bash

declare -r BASE_DIR="${0%/*}"
declare -r PKGBUILD="${BASE_DIR}/PKGBUILD"

main() {

	local -i status_code=0

	[[ -e "${PKGBUILD}" ]] \
		|| { echo "Missing PKGBUILD?!"; exit 1; }

	yes | sudo pacman -S devtools
	extra-x86_64-build -c; status_code=$?

	(( status_code > 0 )) \
		&& { echo "Build failed with status code: ${status_code}!"; exit 2; }

	source "${PKGBUILD}"

	local -r arch="$(uname -m)"
	local -r pkgpath="${BASE_DIR}/${pkgname}-${pkgver}-${pkgrel}-${arch}.pkg.tar.zst"

	[[ -e "${pkgpath}" ]] \
		|| { echo "'${pkgpath}' does not exist!"; exit 3; }

	sudo pacman -U "${pkgpath}"; status_code=$?

	(( status_code > 0 )) && {
		echo "Installation aborted! You can install manually with command:"
		echo "sudo pacman -U '${pkgpath}'"
		exit 4
	}

	echo "Installation successfully completed!"

	rm "${BASE_DIR}"/*.log

	exit 0

}

main "$@"