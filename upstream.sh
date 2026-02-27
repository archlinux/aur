#!/usr/bin/env bash
# shellcheck disable=SC2034

pkg_detect_latest() {
	local url="https://api.github.com/repos/tiann/hapi/releases/latest"
	local version

	version="$(curl -fsSL "${url}" | grep -oP '"tag_name":\s*"v?\K[0-9.]+')"

	if [[ -z "${version}" ]]; then
		echo "Failed to detect latest version" >&2
		return 1
	fi

	printf '%s\n' "${version}"
}

pkg_get_update_params() {
	local version="$1"
	local url="git+https://github.com/tiann/hapi.git#tag=v${version}"
	local filename="hapi"

	# Git source uses SKIP checksum
	printf '%s %s %s %s %s\n' "${url}" "${filename}" "${version}" "sha256" "SKIP"
}

pkg_update_files() {
	local url="$1"
	local filename="$2"
	local pkgver="$3"
	local hash_algo="$4"
	local checksum="$5"
	local pkgbuild="${PKG_DIR}/PKGBUILD"

	# Update PKGBUILD (source line uses ${pkgver} variable, auto-updates)
	sed -i "s/^pkgver=.*/pkgver=${pkgver}/" "${pkgbuild}"
	sed -i "s/^pkgrel=.*/pkgrel=1/" "${pkgbuild}"
}
