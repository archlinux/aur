# Contributor: Piotr Kempa <kosmici-atakuja at wp dot pl>
# Maintainer: Erik Johnson <palehose at gmail dot com>
pkgname=run-mailcap
_srcname=mailcap
pkgver=3.70
pkgrel=1
_ubunturel=+nmu1ubuntu1
pkgdesc="The run-mailcap script from Ubuntu's mailcap package"
url=https://packages.ubuntu.com/search?keywords=${_srcname}
arch=(any)
license=(GPL)
depends=(perl)
conflicts=()
makedepends=()
source=(http://archive.ubuntu.com/ubuntu/pool/main/m/${_srcname}/${_srcname}_${pkgver}${_ubunturel}.tar.xz)
sha256sums=(caebcf23d9d47ea6b75fda5e191521e495e527e47b4fca74ac3802de4adcce71)

package() {
	install -d -m 0755 "${pkgdir}/usr/bin"
	install -m 0755 "${srcdir}/${_srcname}-${pkgver}${_ubunturel}/${pkgname}" "${pkgdir}/usr/bin/"
}
