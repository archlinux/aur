# Maintainer: Maikel Wever <maikelwever@gmail.com>

pkgname=python-blindspin
pkgver=2.0.1
pkgrel=1
pkgdesc="Braille Spinner for Python"
url="https://github.com/kennethreitz/blindspin"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
#source=("https://github.com/kennethreitz/blindspin/archive/v${pkgver}.tar.gz")
source=("https://github.com/kennethreitz/blindspin/archive/c4960e57743950da32ecf2a31ba51982166d7a67.zip")
md5sums=('b6b2033b304933b1950cb9b842630762')
arch=('any')

package() {
  #cd "$srcdir/blindspin-$pkgver"
  cd "$srcdir/blindspin-c4960e57743950da32ecf2a31ba51982166d7a67"
  python setup.py install --root="$pkgdir/" --optimize=1
  # No license file currently exists :(
  #mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  #cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
