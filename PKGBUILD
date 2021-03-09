# Maintainer: Jake <aur@ja-ke.tech>

pkgname=('python2-rtree')
_pyname=Rtree
pkgver=0.9.7
pkgrel=1
pkgdesc='Python wrapper of libspatialindex'
url='http://toblerity.github.com/rtree/'
arch=('any')
license=('LGPL2.1')
depends=('libspatialindex-git')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/R/Rtree/Rtree-${pkgver}.tar.gz")
sha256sums=('be8772ca34699a9ad3fb4cfe2cfb6629854e453c10b3328039301bbfc128ca3e')


package() {
  cd "$srcdir/$_pyname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
