# Maintainer: Look <notkool@protonmail.com>
pkgname=miru-bin
pkgver=4.2.6
pkgrel=1
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
depends=('xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/ThaUnknown/miru/releases/download/v${pkgver}/linux-Miru-${pkgver}.deb")
sha512sums_x86_64=('c825b62016fdb51e6fb0548f3c8399c30723a34e58bf9678544870d0aba2cbb9dfae4f3a461676fc5d36a0d86c0d07500a7f03e73fec986bf3ffa1959ba3e94c')

package() {

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Miru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
