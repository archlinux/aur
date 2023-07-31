# Maintainer: Look <notkool@protonmail.com>
pkgname=miru-bin
pkgver=4.2.11
pkgrel=1
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
depends=('xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/ThaUnknown/miru/releases/download/v${pkgver}/linux-Miru-${pkgver}.deb")
sha512sums_x86_64=('a39ed07a9f8aebfc8e6c3713070a2a69c7eab895823f2b422c23f7e012c76c4e0ab51a8b7bbf63e9792d057bfccd7441e993a10c0acdb243e927419536659189')

package() {

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Miru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
