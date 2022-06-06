# Maintainer: Look <notkool@protonmail.com>
pkgname=miru-bin
pkgver=2.4.5
pkgrel=1
pkgdesc="Bittorrent streaming software for cats"
arch=('x86_64')
url="https://github.com/ThaUnknown/miru"
license=('GPL-3.0')
depends=('xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/ThaUnknown/miru/releases/download/v${pkgver}/linux-Miru-${pkgver}.deb")
sha512sums_x86_64=('2f84a3de9ad3910bd7cc8b0ab8cc5af191acb8159656e6b85749ee593fa2841309df4ffdd54daa7d107af7fb326bb1b85163a2ea73624038b685aabb3d094854')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Miru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
