# Maintainer: Jake <aur@ja-ke.tech>

pkgname=('python2-rtree')
_pyname=Rtree
pkgver=0.9.4
pkgrel=1
pkgdesc='Python wrapper of libspatialindex'
url='http://toblerity.github.com/rtree/'
arch=('any')
license=('LGPL2.1')
depends=('libspatialindex-git')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/R/Rtree/Rtree-${pkgver}.tar.gz")
sha256sums=('cae327e2c03b3da4ea40d0fdf68f3e55fe9f302c56b9f31e1bfeb36dbea73f44')


package() {
  cd "$srcdir/$_pyname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
