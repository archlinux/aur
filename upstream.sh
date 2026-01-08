#!/usr/bin/env bash

pkg_detect_latest() {
	local api_url="https://api.github.com/repos/SlotSun/dart_simple_live/releases"
	local version
    version="$(curl -fsSL "${api_url}" | jq -r '.[0].tag_name | ltrimstr("v")')"
	if [[ -z "${version}" ]]; then
		echo "Failed to parse version from API response" >&2
		return 1
	fi

	printf '%s\n' "${version}"
}

pkg_get_update_params() {
	local version="$1"
	local base_url="https://github.com/SlotSun/dart_simple_live/releases/download/v${version}"
	local filename="Slive.tar.gz"
	local url="${base_url}/${filename}"

	# Download and calculate SHA256 for x86_64
	local tmpdir tmpfile sha256
	tmpdir="$(mktemp -d)"
	tmpfile="${tmpdir}/${filename}"

	curl -fsSL --retry 3 --retry-delay 2 -o "${tmpfile}" "${url}"
	sha256="$(sha256sum "${tmpfile}" | awk '{print $1}')"

	# Cleanup
	rm -rf "${tmpdir}"

	# Return: url filename pkgver hash_algo checksum
	printf '%s %s %s %s %s\n' "${url}" "${filename}" "${version}" "sha256" "${sha256}"
}

pkg_update_files() {
	local url="$1"
	local filename="$2"
	local pkgver="$3"
	local hash_algo="$4"
	local checksum="$5"
	local pkgbuild="${PKG_DIR}/PKGBUILD"

    local base_url="${url%/*}"
	local url_x86_64="${base_url}/Slive.tar.gz"
    
	sed -i "s/^pkgver=.*/pkgver=${pkgver}/" "${pkgbuild}"
	sed -i "s/^pkgrel=.*/pkgrel=1/" "${pkgbuild}"
    sed -i "s|^source=(\".*\")|source=(\"Slive.tar.gz::${url_x86_64}\")|" "${pkgbuild}"
    sed -i "s/^${hash_algo}sums=.*/${hash_algo}sums=('${checksum}')/" "${pkgbuild}"

	echo "Warning: Only x86_64 checksum updated. Please verify aarch64 manually." >&2
}