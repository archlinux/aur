# Maintainer: nekonyuu <nk@nyuu.eu>
pkgname=python2-deepdiff
pkgver=2.5.0
pkgrel=1
pkgdesc="Deep Difference of dictionaries, iterables, strings and other objects."
arch=('any')
url="https://github.com/seperman/deepdiff"
license=('MIT')
depends=('python2')
source=(https://github.com/seperman/deepdiff/archive/v${pkgver}.tar.gz)
sha256sums=('23a8a9c3a03707fdcb05d5a0e5c38487ae1a2014fc7fc466bc9ac4035af21aa2')

build() {
  cd "$srcdir"/deepdiff-${pkgver}
  python2 setup.py build
}

package() {
  cd "$srcdir"/deepdiff-${pkgver}
  python2 setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}
