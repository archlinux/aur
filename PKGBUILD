# Maintainer: Look <notkool@protonmail.com>
pkgname=miru-bin
pkgver=4.5.6
pkgrel=1
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
depends=('xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/ThaUnknown/miru/releases/download/v${pkgver}/linux-Miru-${pkgver}.deb")
sha512sums_x86_64=('01f99146e8627fe7a2fec15172f6c2f69ce0d90d5a94efa47ba38cedab1f5f7f0a8a65f0a42b2e2ef6de689298c1966a99be331d33579597842237d442a30f95')

package() {

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Miru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
