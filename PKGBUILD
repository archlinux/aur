# Maintainer: Jake <aur@ja-ke.tech>

pkgname=('python2-rtree')
_pyname=Rtree
pkgver=0.8.3
pkgrel=1
pkgdesc='Python wrapper of libspatialindex'
url='http://toblerity.github.com/rtree/'
arch=('any')
license=('LGPL2.1')
depends=('libspatialindex-git')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/R/Rtree/Rtree-${pkgver}.tar.gz")
sha256sums=('6cb9cf3000963ea6a3db777a597baee2bc55c4fc891e4f1967f262cc96148649')


package() {
  cd "$srcdir/$_pyname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
