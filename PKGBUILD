# Contributor: ConnorBehan <connor.behan@gmail.com>
pkgname=scale2x
pkgver=3.1
pkgrel=1
pkgdesc="Bitmap scaling algorithm that improves the resolution of a PNG"
arch=(i686 x86_64)
url="http://scale2x.sourceforge.net/"
license=('GPL')
depends=('libpng>=1.4')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make prefix="$pkgdir"/usr install
}
md5sums=('a1c6d2bda4360d13432e60b6e6ecbb5a')
