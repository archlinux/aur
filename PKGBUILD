# Maintainer: Look <notkool@protonmail.com>
pkgname=miru-bin
pkgver=4.4.19
pkgrel=1
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
depends=('xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/ThaUnknown/miru/releases/download/v${pkgver}/linux-Miru-${pkgver}.deb")
sha512sums_x86_64=('eaca11abb96b027d51bdc171d0af982d084aa7d940eb111eac1483b56939f5fed072c0f17db180cfa11329f665b347504ea6a74000e3bb1d691db16df4421df7')

package() {

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Miru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
