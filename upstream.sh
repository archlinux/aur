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
	local filename="Slive-x86_64-linux.zip"
	local url="${base_url}/${filename}"

	# Download and calculate SHA256 for x86_64
	local tmpdir tmpfile sha256
	tmpdir="$(mktemp -d)"
	tmpfile="${tmpdir}/${filename}"

	curl -fsSL --retry 3 --retry-delay 2 -o "${tmpfile}" "${url}"
	sha256="$(sha256sum "${tmpfile}" | awk '{print $1}')"


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
	local url_x86_64="${base_url}/Slive-x86_64-linux.zip"
    local url_aarch64="${base_url}/Slive-aarch64-linux.zip"
    local desktop_url="https://raw.githubusercontent.com/SlotSun/dart_simple_live/refs/tags/v${pkgver}/simple_live_app/assets/io.github.SlotSun.Slive.desktop"

	sed -i "s/^pkgver=.*/pkgver=${pkgver}/" "${pkgbuild}"
	sed -i "s/^pkgrel=.*/pkgrel=1/" "${pkgbuild}"
    sed -i "s|^source_x86_64=.*|source_x86_64=(\"Slive-x86_64-linux.zip::${url_x86_64}\" \"${desktop_url}\")|" "${pkgbuild}"
	sed -i "s|^source_aarch64=.*|source_aarch64=(\"Slive-aarch64-linux.zip::${url_aarch64}\" \"${desktop_url}\")|" "${pkgbuild}"
	sed -i "s/^${hash_algo}sums_x86_64=.*/${hash_algo}sums_x86_64=('${checksum}' 'SKIP')/" "${pkgbuild}"

	echo "Warning: Only x86_64 checksum updated. Please verify aarch64 manually." >&2
}