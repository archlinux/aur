# Maintainer: Look <notkool@protonmail.com>
pkgname=miru-bin
pkgver=2.4.2
pkgrel=1
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
depends=('xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/ThaUnknown/miru/releases/download/v2.4.2/linux-Miru-2.4.2.deb")
sha512sums_x86_64=('e3c4ef866fa8431cf9cc9d9c4f8d3bfe68e9321183cf9f9272c19cb50c03ca2da589facf6258e9cc18f699650790bf29e6d78788d3da80fea7bf50ba5e0abb58')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Miru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
