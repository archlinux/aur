# Maintainer: Steffen Lange <gclog@stelas.de>
pkgname=gclog
pkgver=0.2.5
pkgrel=1
pkgdesc="Geiger Counter Logger"
arch=('x86_64')
url="http://www.dateihal.de/cms/gclog"
license=('GPL3')
depends=('sh')
source=("http://www.dateihal.de/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
        cd "$srcdir/$pkgname-$pkgver"
        make
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" install
}
