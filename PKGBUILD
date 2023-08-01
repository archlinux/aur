# Maintainer: Look <notkool@protonmail.com>
pkgname=miru-bin
pkgver=4.3.0
pkgrel=1
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
depends=('xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/ThaUnknown/miru/releases/download/v${pkgver}/linux-Miru-${pkgver}.deb")
sha512sums_x86_64=('07ac80065a02d68cd6db8b86cf0771bf7b12b510b672605a4c70fb5b2ae60b1d48144a8200a55632b1e4789dc3af046396885318d9b32e79d582de93fbd219a5')

package() {

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Miru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
