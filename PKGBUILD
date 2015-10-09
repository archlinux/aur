# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=scifig
pkgver=0.1.1
pkgrel=2
pkgdesc="A build tool for (non?)-scientific figures"
arch=('any')
url="https://scifig.readthedocs.org/"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/s/scifig/scifig-${pkgver}.tar.gz)
sha256sums=('cdca338247f6f2c9ddd9ccd3b522615f5b1684504839e1743546bc3031c3b14e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
