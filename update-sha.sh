#!/usr/bin/env bash

main() {
	local file url pkgrel

	file="duo-desktop-latest.x86_64.rpm"
	url="https://desktop.pkg.duosecurity.com/${file}"

	wget -cO "${file}" "${url}"

	sum=$(sha512sum "${file}" | cut -d' ' -f1)
	old_sum=$(grep sha512sums PKGBUILD | cut -d= -f2 | sed -e 's/['\''"( )]//g')

	if [[ "${sum}" == "${old_sum}" ]]; then
		echo "File has not changed. Exiting..."
		exit 0
	fi

	old_pkgrel=$(grep pkgrel PKGBUILD | cut -d= -f2)
	pkgrel=$((old_pkgrel + 1))

	sed -i "s|sha512sums=('.*')|sha512sums=('${sum}')|" PKGBUILD
	sed -i "s|pkgrel=${old_pkgrel}|pkgrel=${pkgrel}|" PKGBUILD

	echo "Updated PKGBUILD with new checksum and incremented pkgrel to ${pkgrel}."
}

main "$@"
