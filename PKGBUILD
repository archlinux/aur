# Maintainer: Allen Choong <allen.choong at gmail dot com>
pkgname=prayer-clock
pkgver=3.0.2
pkgrel=1
pkgdesc="Catholic prayers reminder, contains Angelus and 3 O'clock Prayer"
url='http://sourceforge.net/projects/prayerclock/'
arch=('i686' 'x86_64')
license=('BSD')
depends=('gtk3' 'gtkmm3')
source="http://downloads.sourceforge.net/project/prayerclock/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
md5sums=('b4b2d6e7a98d73c8174393aace277cb1')


package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"
	./configure --prefix=/usr
	make 
	make prefix="${pkgdir}/usr" install
}
