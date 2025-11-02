#!/usr/bin/env bash
# shellcheck disable=SC2034

pkg_detect_latest() {
	local base_url="https://download.kde.org/stable/kdenlive"
	local index minor latest_minor version

	index="$(curl -fsSL "${base_url}/")"
	minor="$(printf '%s\n' "${index}" | grep -Po '(?<=href=")[0-9]+\.[0-9]+/' | tr -d '/' | sort -V | tail -n1)"
	if [[ -z "${minor}" ]]; then
		echo "Failed to detect minor version from ${base_url}" >&2
		return 1
	fi

	local linux_index
	linux_index="$(curl -fsSL "${base_url}/${minor}/linux/")"
	version="$(printf '%s\n' "${linux_index}" | grep -Po 'kdenlive-[0-9]+\.[0-9]+\.[0-9]+-x86_64\.AppImage' | sed -E 's/kdenlive-([0-9]+\.[0-9]+\.[0-9]+)-x86_64\.AppImage/\1/' | sort -V | tail -n1)"

	if [[ -z "${version}" ]]; then
		echo "Failed to detect full version from ${base_url}/${minor}/linux" >&2
		return 1
	fi

	printf '%s\n' "${version}"
}

pkg_get_update_params() {
	local version="$1"
	local minor="${version%.*}"
	local filename="kdenlive-${version}-x86_64.AppImage"
	local url="https://download.kde.org/stable/kdenlive/${minor}/linux/${filename}"

	# Download and calculate SHA256
	local tmpdir tmpfile sha256
	tmpdir="$(mktemp -d)"
	trap 'rm -rf "${tmpdir}"' EXIT
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

	sed -i "s/^pkgver=.*/pkgver=${pkgver}/" "${pkgbuild}"
	sed -i "s/^pkgrel=.*/pkgrel=1/" "${pkgbuild}"
	sed -i "s|^source_x86_64=.*|source_x86_64=(\"${filename}::${url}\")|" "${pkgbuild}"
	sed -i "s/^${hash_algo}sums_x86_64=.*/${hash_algo}sums_x86_64=('${checksum}')/" "${pkgbuild}"
}
