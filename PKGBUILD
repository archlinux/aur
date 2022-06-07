# Maintainer: Look <notkool@protonmail.com>
pkgname=miru-bin
pkgver=2.4.6
pkgrel=1
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
depends=('xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/ThaUnknown/miru/releases/download/v${pkgver}/linux-Miru-${pkgver}.deb")
sha512sums_x86_64=('cb5c36a6b81e7c6e4cab177824b89916794715a59493d99dc4dcd3aabb3222bbadabdd3c01fb83944ac15d8cf7d7b317094138832374c6e4a997868f6fb7ea87')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Miru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
