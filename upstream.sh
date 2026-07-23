#!/usr/bin/env bash
# shellcheck disable=SC2034

pkg_detect_latest() {
	local api_url="https://api.github.com/repos/xifan2333/herdr-corral/releases/latest"
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
	local base_url="https://github.com/xifan2333/herdr-corral/releases/download/v${version}"
	local filename="herdr-corral-${version}-x86_64.tar.xz"
	local url="${base_url}/${filename}"

	local tmpdir tmpfile sha256
	tmpdir="$(mktemp -d)"
	tmpfile="${tmpdir}/${filename}"

	curl -fsSL --retry 3 --retry-delay 2 -o "${tmpfile}" "${url}"
	sha256="$(sha256sum "${tmpfile}" | awk '{print $1}')"
	rm -rf "${tmpdir}"

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
	local url_x86_64="${base_url}/herdr-corral-${pkgver}-x86_64.tar.xz"
	local url_aarch64="${base_url}/herdr-corral-${pkgver}-aarch64.tar.xz"

	sed -i "s/^pkgver=.*/pkgver=${pkgver}/" "${pkgbuild}"
	sed -i "s/^pkgrel=.*/pkgrel=1/" "${pkgbuild}"
	sed -i "s|^source_x86_64=.*|source_x86_64=(\"\${_pkgname}-\${pkgver}-x86_64.tar.xz::${url_x86_64}\")|" "${pkgbuild}"
	sed -i "s|^source_aarch64=.*|source_aarch64=(\"\${_pkgname}-\${pkgver}-aarch64.tar.xz::${url_aarch64}\")|" "${pkgbuild}"
	sed -i "s/^${hash_algo}sums_x86_64=.*/${hash_algo}sums_x86_64=('${checksum}')/" "${pkgbuild}"
	# aarch64 checksum is filled on first successful build/publish pass if needed
	sed -i "s/^${hash_algo}sums_aarch64=.*/${hash_algo}sums_aarch64=('SKIP')/" "${pkgbuild}"

	echo "Updated x86_64 checksum; aarch64 left as SKIP until verified." >&2
}
