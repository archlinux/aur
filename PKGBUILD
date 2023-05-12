# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
pkgbase=stunserver
pkgname=('stunserver' 'stunclient')
pkgver=1.2.16
pkgrel=1
pkgdesc="STUN client and server"
url="https://www.stunprotocol.org/"
arch=('x86_64' 'i386')
license=('GPL3')
depends=('boost-libs')
makedepends=('boost')
#optdepends=('')
sha256sums=('4479e1ae070651dfc4836a998267c7ac2fba4f011abcfdca3b8ccd7736d4fd26')
source=("https://www.stunprotocol.org/${pkgbase}-${pkgver}.tgz")

package_stunserver() {
	cd "${srcdir}/${pkgbase}"
	make
	install -d "${pkgdir}/usr/bin"
	install -m755 "$pkg" "${pkgdir}/usr/bin/"
}

package_stunclient() {
	cd "${srcdir}/${pkgbase}"
	make
	install -d "${pkgdir}/usr/bin"
	install -m755 "$pkg" "${pkgdir}/usr/bin/"
}
