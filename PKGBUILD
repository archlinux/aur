# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=python2-libsass
pkgver=0.9.2
pkgrel=1
pkgdesc="Python binding for libsass CSS compiler"
arch=(i686 x86_64)
url="http://dahlia.kr/libsass-python/"
depends=(python2 python2-six)
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

md5sums=('3078f2801b36e60bc70fcb1398d4d759')
