#Maintainer: peippo <christoph.fink@gmail.com>

pkgname=('python-rtree')
_pyname=rtree
pkgver=0.8.3
pkgrel=2

pkgdesc='Python wrapper for libspatialindex'
url='http://toblerity.github.com/rtree/'
arch=('any')
license=('LGPL2.1')
depends=('spatialindex')
makedepends=('python-setuptools')
source=("https://github.com/Toblerity/rtree/archive/${pkgver}.tar.gz")
sha256sums=('ab9d29ea3935d189ce32217ad5f5aff464a7ded9e9f9777e2d8dbf11dcf90b93')


package() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
