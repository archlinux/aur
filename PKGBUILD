#Contributor: Scott Lawrence <bytbox@gmail.com>
pkgname=python-libsass
pkgver=0.7.0
pkgrel=1
pkgdesc="Python binding for libsass CSS compiler"
arch=(any)
url="http://dahlia.kr/libsass-python/"
depends=(python)
makedepends=(libsass)
source=(https://pypi.python.org/packages/source/l/libsass/libsass-${pkgver}.tar.gz)
license=('LGPL')

build() {
	cd $srcdir/libsass-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/libsass-$pkgver
	python setup.py install --root=$pkgdir
}

md5sums=('809e4f66bd54eeb46342d7462ce961e6')
