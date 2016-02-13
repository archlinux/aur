# Maintainer: Jake <ja.ke@posteo.de>

pkgname=('python2-rtree')
_pyname=Rtree
pkgver=0.8.2
pkgrel=2
pkgdesc='Python wrapper of libspatialindex'
url='http://toblerity.github.com/rtree/'
arch=('any')
license=('LGPL2.1')
depends=('libspatialindex-git')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/R/Rtree/Rtree-${pkgver}.tar.gz")
sha256sums=('064ecd9791fe170a8492f4ae75b0cbe8e62b5392f136a159a24d1b70c86d3c3f')


package() {
  cd "$srcdir/$_pyname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}