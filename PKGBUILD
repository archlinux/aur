# Maintainer: Look <notkool@protonmail.com>
pkgname=miru-bin
pkgver=2.14.0
pkgrel=1
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64' 'aarch64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
depends=('xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
pkgver=2.14.0
sha512sums_x86_64=('SKIP')
pkgver=2.14.0
sha512sums_aarch64=('SKIP')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Miru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
