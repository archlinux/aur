# Maintainer: Look <notkool@protonmail.com>
pkgname=miru-bin
pkgver=4.4.11
pkgrel=1
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
depends=('xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/ThaUnknown/miru/releases/download/v${pkgver}/linux-Miru-${pkgver}.deb")
sha512sums_x86_64=('f82f2560a47f0d2ccc83a1861b41f0e6f7453bfbc15c23225dfa008c625cc079ab5e802c48b202cc0fb2756426c5f9db05bca01b5ff81ded3acc5c43b098abd0')

package() {

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Miru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
