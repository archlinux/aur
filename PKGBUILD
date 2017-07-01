# Maintainer: Allen Choong <allen.choong at gmail dot com>
pkgname=prayer-clock
pkgver=4.0.0
pkgrel=1
pkgdesc="Catholic prayers reminder, contains Angelus and 3 O'clock Prayer"
url='https://github.com/allencch/prayer-clock'
arch=('i686' 'x86_64')
license=('BSD')
depends=('gtk3' 'gtkmm3')
source=("https://github.com/allencch/prayer-clock/raw/master/build/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f838c6d98b6eaadac226399a0ced9c7569378d43a28a0217a7ada58092aeab15')


package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"
	./configure --prefix=/usr
	make
	make prefix="${pkgdir}/usr" install
}
