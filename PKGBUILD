# Maintainer: Look <notkool@protonmail.com>
pkgname=miru-bin
pkgver=4.5.8
pkgrel=1
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
depends=('xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/ThaUnknown/miru/releases/download/v${pkgver}/linux-Miru-${pkgver}.deb")
sha512sums_x86_64=('cc82982982455088d517e0aeb10b64524738058f0938f2adec4115ca1f11d19de6b068da174e487e860099207660e585d7b4c645bd5972bb592b028fec212713')

package() {

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Miru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
