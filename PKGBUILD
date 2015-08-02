# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=scifig
pkgver=0.1
pkgrel=1
pkgdesc="A build tool for (non?)-scientific figures"
arch=('any')
url="https://scifig.readthedocs.org/"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/s/scifig/scifig-${pkgver}.tar.gz)
sha256sums=('f2fe58ee3e693d91c38f8535ef52c803bf8e3f831728304c744b2bf0b2e5eca0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
