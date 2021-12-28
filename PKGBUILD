# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=libdali
pkgver=1.8
pkgrel=1
pkgdesc="The C library for the DataLink protocol."
arch=("x86_64")
url="https://github.com/iris-edu/libdali"
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('aaa2fb08eb688d6b39093b2a93c7edba44551a1465a5e338cc258a715ccf681e')

build() {
	cd "${pkgname}-${pkgver}"
	make shared
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}
# vim:set ts=4 sw=4:

