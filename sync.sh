#! /bin/bash
set -e


mainFunction () {
	changeToHere
	syncFiles
	makepkg --printsrcinfo > .SRCINFO
}


changeToHere () {
	here="$(realpath "$(dirname "${0}")")"
	cd "${here}"
}


syncFiles () {
	local url="https://raw.githubusercontent.com/Askannz/optimus-manager/refs/heads/master/package"
	local file
	local files=(
		"optimus-manager.install"
		"PKGBUILD"
	)

	for file in "${files[@]}"; do
		curl --silent "${url}/${file}" > "${file}"
	done
}


mainFunction
