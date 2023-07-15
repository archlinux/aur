# Maintainer: Look <notkool@protonmail.com>
pkgname=miru-bin
pkgver=4.2.1
pkgrel=1
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
depends=('xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/ThaUnknown/miru/releases/download/v${pkgver}/linux-Miru-${pkgver}.deb")
sha512sums_x86_64=('b031df910d226f4d7ba3fb181bf2563536e211e001f10f85d61dd1179e9b8d8457574d37de7ce115e9cf2c34bfdcad2003f3aa6fc8d52c71e200714b8995f20a')

package() {

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Miru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
