pkgname=opentabletdriver-openrc
pkgver=2026.922.0
pkgrel=1
pkgdesc="OpenRC Init Scripts for OpenTabletDriver"
arch=('any')
license=('BSD-3-Clause')
depends=('opentabletdriver')
optdepends=('openrc: To make use of initscript.')
provides=()
replaces=()
conflicts=()
backup=()
options=('!emptydirs')
source=(
	'LICENSE'
	'opentabletdriver')

sha256sums=(
	'612a6f8c5959967b7d3476c5e86e264d8d3e2121bc8cf676ca0d4ade8d019e62'
	'2b6c61de11a6ea8eae7153cf591438d9eaf3090b4a46d5e9d9af951000e4f25f')

package() {
	install -D -v -m775 "${srcdir}/opentabletdriver" "${pkgdir}/etc/user/init.d/opentabletdriver"
	install -D -v -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
