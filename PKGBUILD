# Contributor: Michal Hybner <dta081@gmail.com>
# Current maintainter: Alexandre Courbot <gnurou@gmail.com>
pkgname=libkarma
pkgver=0.1.1
pkgrel=2
pkgdesc="Network access library for the Rio Karma"
arch=(i686 x86_64)
url="http://www.freakysoft.de/html/libkarma/"
license=('GPL')
depends=('libusb' 'taglib')
source=(http://www.freakysoft.de/libkarma/libkarma-${pkgver}.tar.gz)
md5sums=('3a49267ea0e8582ec0f719aa88a86e5c')

build() {
cd ${startdir}/src/libkarma-${pkgver}/
make || return 1
make PREFIX=${startdir}/pkg/usr install
}

