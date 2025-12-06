#!/usr/bin/env bash
# shellcheck disable=SC2034

pkg_detect_latest() {
	local url="https://dl.roxybrowser.com/app-download/Linux-64-latest"
	local tmpdir tmpfile version

	tmpdir="$(mktemp -d)"
	tmpfile="${tmpdir}/roxybrowser.deb"

	# Download the latest deb package
	if ! curl -fsSL --retry 3 --retry-delay 2 -o "${tmpfile}" "${url}"; then
		echo "Failed to download from ${url}" >&2
		rm -rf "${tmpdir}"
		return 1
	fi

	# Extract control file and get version
	cd "${tmpdir}" || return 1
	ar x "${tmpfile}" control.tar.xz
	version="$(tar -xOf control.tar.xz ./control | grep -Po '^Version:\s*\K[0-9]+\.[0-9]+\.[0-9]+')"

	# Cleanup
	rm -rf "${tmpdir}"

	if [[ -z "${version}" ]]; then
		echo "Failed to parse version from deb package" >&2
		return 1
	fi

	printf '%s\n' "${version}"
}

pkg_get_update_params() {
	local version="$1"
	local filename="roxybrowser-${version}.deb"
	local url="https://dl.roxybrowser.com/app-download/Linux-64-latest"

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
	sed -i "s|^source_x86_64=.*|source_x86_64=(\"${filename}::${url}\")|" "${pkgbuild}"
	sed -i "s/^${hash_algo}sums_x86_64=.*/${hash_algo}sums_x86_64=('${checksum}')/" "${pkgbuild}"
}
