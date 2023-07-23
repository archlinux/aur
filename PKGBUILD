# Maintainer: Look <notkool@protonmail.com>
pkgname=miru-bin
pkgver=4.2.7
pkgrel=1
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
depends=('xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/ThaUnknown/miru/releases/download/v${pkgver}/linux-Miru-${pkgver}.deb")
sha512sums_x86_64=('9981c431b31c7f78ca84d13fff7650a2a0195a5ac108df3ee4fb28121c5b1f282ee248979df76b2a12c8bb6433401ac5867504e6cd912c4003a0dc797df91978')

package() {

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Miru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
