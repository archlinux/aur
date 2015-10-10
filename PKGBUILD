# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=python2-libsass
pkgver=0.8.3
pkgrel=1
pkgdesc="Python binding for libsass CSS compiler"
arch=(i686 x86_64)
url="http://dahlia.kr/libsass-python/"
depends=(python2)
makedepends=(libsass)
source=(https://pypi.python.org/packages/source/l/libsass/libsass-${pkgver}.tar.gz)
license=('LGPL')

build() {
	cd $srcdir/libsass-$pkgver
	python2 setup.py build
}

package() {
	cd $srcdir/libsass-$pkgver
	python2 setup.py install --root=$pkgdir
}

md5sums=('011f35ccfcacafe90ea20a8103f616d5')
