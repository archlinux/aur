# Maintainer: Allen Choong <allen.choong at gmail dot com>
pkgname=prayer-clock
pkgver=3.0.3
pkgrel=4
pkgdesc="Catholic prayers reminder, contains Angelus and 3 O'clock Prayer"
url='http://sourceforge.net/projects/prayerclock/'
arch=('i686' 'x86_64')
license=('BSD')
depends=('gtk3' 'gtkmm3')
source=("https://github.com/allencch/prayer-clock/raw/master/build/${pkgname}-${pkgver}.tar.gz")
md5sums=('5ce4c6df03bf011f65596c4f99ce8b3b')


package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"
	./configure --prefix=/usr
	make
	make prefix="${pkgdir}/usr" install
}
