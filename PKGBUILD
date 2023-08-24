# Maintainer: Look <notkool@protonmail.com>
pkgname=miru-bin
pkgver=4.3.11
pkgrel=1
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
depends=('xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/ThaUnknown/miru/releases/download/v${pkgver}/linux-Miru-${pkgver}.deb")
sha512sums_x86_64=('8b5ced08df84617362f0abf9ca20fb331d32e922a34fc25d59e59b6e2a5d2af6ce0e61809899df0ab662b5fb3d5ba1c88e51b860f7cfb56b79f29917d023a7ca')

package() {

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Miru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
