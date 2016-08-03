# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=scifig
pkgver=0.1.3
pkgrel=1
pkgdesc="A build tool for (non?)-scientific figures"
arch=('any')
url="https://scifig.readthedocs.org/"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/7c/f8/78d3a43120337c7bca27ebd7abc93908ac14b5aebc453766f958b7d716db/scifig-${pkgver}.tar.gz)
sha256sums=('326d85bf9788ebe9778398726dcc4b400568bb7add5825a39be067b95de78c8d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
