#!/usr/bin/env bash
# shellcheck disable=SC2034

_pkg_api_url="https://client-webapi.oray.com/softwares/SUNLOGIN_X_LINUX?x64=1&versiontype=stable"

pkg_fetch_metadata() {
	curl -fsSL "${_pkg_api_url}"
}

pkg_detect_latest() {
	local json_data version

	json_data="$(pkg_fetch_metadata)"
	version="$(printf '%s\n' "${json_data}" | jq -r '.versionno // empty')"

	if [[ -z "${version}" ]]; then
		echo "Failed to parse version from ${_pkg_api_url}" >&2
		return 1
	fi

	printf '%s\n' "${version}"
}

pkg_get_update_params() {
	local version="$1"
	local json_data url filename expected_md5

	json_data="$(pkg_fetch_metadata)"
	url="$(printf '%s\n' "${json_data}" | jq -r '([.downloadurlmultiple[]? | select((.name // "") | test("Ubuntu|Deepin"; "i")) | .url][0] // .downloadurl // empty)')"
	expected_md5="$(printf '%s\n' "${json_data}" | jq -r '.md5 // empty' | tr '[:upper:]' '[:lower:]')"

	if [[ -z "${url}" ]]; then
		echo "Failed to parse deb download URL from ${_pkg_api_url}" >&2
		return 1
	fi

	filename="awesun-${version}-x86_64.deb"
	url="https://dl.oray.com/sl/linux/${filename}"

	local tmpdir tmpfile sha256 actual_md5
	tmpdir="$(mktemp -d)"
	tmpfile="${tmpdir}/${filename}"

	curl -fsSL --retry 3 --retry-delay 2 -o "${tmpfile}" "${url}"
	if [[ -n "${expected_md5}" ]]; then
		actual_md5="$(md5sum "${tmpfile}" | awk '{print $1}')"
		if [[ "${actual_md5}" != "${expected_md5}" ]]; then
			echo "MD5 mismatch for ${url}: expected ${expected_md5}, got ${actual_md5}" >&2
			rm -rf "${tmpdir}"
			return 1
		fi
	fi

	sha256="$(sha256sum "${tmpfile}" | awk '{print $1}')"
	rm -rf "${tmpdir}"

	# Return: url filename pkgver hash_algo checksum
	printf '%s %s %s %s %s\n' "${url}" "${filename}" "${version}" "sha256" "${sha256}"
}

pkg_escape_sed_replacement() {
	printf '%s' "$1" | sed -e 's/[&|]/\\&/g'
}

pkg_update_files() {
	local url="$1"
	local filename="$2"
	local pkgver="$3"
	local hash_algo="$4"
	local checksum="$5"
	local pkgbuild="${PKG_DIR}/PKGBUILD"

	local escaped_url escaped_filename
	escaped_url="$(pkg_escape_sed_replacement "${url}")"
	escaped_filename="$(pkg_escape_sed_replacement "${filename}")"

	sed -i "s/^pkgver=.*/pkgver=${pkgver}/" "${pkgbuild}"
	sed -i "s/^pkgrel=.*/pkgrel=1/" "${pkgbuild}"
	sed -i "s|^source_x86_64=.*|source_x86_64=(\"${escaped_filename}::${escaped_url}\")|" "${pkgbuild}"
	sed -i "s/^${hash_algo}sums_x86_64=.*/${hash_algo}sums_x86_64=('${checksum}')/" "${pkgbuild}"
}
