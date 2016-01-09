# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=scifig
pkgver=0.1.2
pkgrel=1
pkgdesc="A build tool for (non?)-scientific figures"
arch=('any')
url="https://scifig.readthedocs.org/"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/s/scifig/scifig-${pkgver}.tar.gz)
sha256sums=('0eb138a9c87036494c0f8160ddbd83bc122ad354d3f38ca8924dcc9088ebd959')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
