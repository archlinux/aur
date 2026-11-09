#!/usr/bin/env bash
# shellcheck disable=SC2034

pkg_detect_latest() {
	curl -fsSL "https://api.github.com/repos/hj01857655/kiro-account-manager/releases/latest" |
		grep -oP '"tag_name":\s*"v?\K[0-9]+\.[0-9]+\.[0-9]+'
}

pkg_get_update_params() {
	local version="$1"
	local filename="KiroAccountManager_${version}_amd64.deb"
	local url="https://github.com/hj01857655/kiro-account-manager/releases/download/v${version}/${filename}"

	# Download and calculate SHA256
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

	# Update PKGBUILD
	sed -i "s/^pkgver=.*/pkgver=${pkgver}/" "${pkgbuild}"
	sed -i "s/^pkgrel=.*/pkgrel=1/" "${pkgbuild}"
	sed -i "s|^source_x86_64=.*|source_x86_64=(\"KiroAccountManager_${pkgver}_amd64.deb::${url}\")|" "${pkgbuild}"
	sed -i "s/^${hash_algo}sums_x86_64=.*/${hash_algo}sums_x86_64=('${checksum}')/" "${pkgbuild}"
}
