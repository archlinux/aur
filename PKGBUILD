# Maintainer: nekonyuu <nk@nyuu.eu>
pkgname=python2-deepdiff
pkgver=1.1.0
pkgrel=1
pkgdesc="Deep Difference of dictionaries, iterables, strings and other objects."
arch=('any')
url="https://github.com/seperman/deepdiff"
license=('MIT')
depends=('python2' 'salt')
source=(https://pypi.python.org/packages/source/d/deepdiff/deepdiff-${pkgver}.tar.gz)
sha256sums=('ea82865707c974d4e1e4f7e5ab237a4558bb6f8c28c16c7850270ea0f791cc1f')

build() {
  cd "$srcdir"/deepdiff-${pkgver}
  python2 setup.py build
}

package() {
  cd "$srcdir"/deepdiff-${pkgver}
  python2 setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}
