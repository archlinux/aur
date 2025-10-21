#!/usr/bin/env bash
# shellcheck disable=SC2034

pkg_detect_latest() {
	local api_url="https://api.github.com/repos/xifan2333/UniBarrage/releases/latest"
	local json_data version

	json_data="$(curl -fsSL "${api_url}")"
	if [[ -z "${json_data}" ]]; then
		echo "Failed to fetch data from ${api_url}" >&2
		return 1
	fi

	version="$(echo "${json_data}" | grep -Po '"tag_name":\s*"v?\K[0-9]+\.[0-9]+\.[0-9]+')"
	if [[ -z "${version}" ]]; then
		echo "Failed to parse version from API response" >&2
		return 1
	fi

	printf '%s\n' "${version}"
}

pkg_get_update_params() {
	local version="$1"
	local base_url="https://github.com/xifan2333/UniBarrage/releases/download/v${version}"
	local filename_x86_64="UniBarrage-linux-amd64.tar.gz"
	local url_x86_64="${base_url}/${filename_x86_64}"

	# Download and calculate SHA256 for x86_64
	local tmpdir tmpfile sha256
	tmpdir="$(mktemp -d)"
	tmpfile="${tmpdir}/${filename_x86_64}"

	curl -fsSL --retry 3 --retry-delay 2 -o "${tmpfile}" "${url_x86_64}"
	sha256="$(sha256sum "${tmpfile}" | awk '{print $1}')"

	# Cleanup
	rm -rf "${tmpdir}"

	# Return: url filename pkgver hash_algo checksum
	printf '%s %s %s %s %s\n' "${url_x86_64}" "${filename_x86_64}" "${version}" "sha256" "${sha256}"
}

pkg_update_files() {
	local url="$1"
	local filename="$2"
	local pkgver="$3"
	local hash_algo="$4"
	local checksum="$5"
	local pkgbuild="${PKG_DIR}/PKGBUILD"

	# Generate URLs for all architectures
	local base_url="${url%/*}"
	local url_x86_64="${base_url}/UniBarrage-linux-amd64.tar.gz"
	local url_aarch64="${base_url}/UniBarrage-linux-arm64.tar.gz"

	# Update PKGBUILD
	sed -i "s/^pkgver=.*/pkgver=${pkgver}/" "${pkgbuild}"
	sed -i "s/^pkgrel=.*/pkgrel=1/" "${pkgbuild}"
	sed -i "s|^source_x86_64=.*|source_x86_64=(\"UniBarrage-linux-amd64.tar.gz::${url_x86_64}\")|" "${pkgbuild}"
	sed -i "s|^source_aarch64=.*|source_aarch64=(\"UniBarrage-linux-arm64.tar.gz::${url_aarch64}\")|" "${pkgbuild}"
	sed -i "s/^${hash_algo}sums_x86_64=.*/${hash_algo}sums_x86_64=('${checksum}')/" "${pkgbuild}"

	echo "Warning: Only x86_64 checksum updated. Please verify aarch64 manually." >&2
}
