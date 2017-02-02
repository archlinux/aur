# Maintainer: Maikel Wever <maikelwever@gmail.com>

pkgname=python-blindspin
pkgver=2.0.0
pkgrel=1
pkgdesc="Braille Spinner for Python"
url="https://github.com/kennethreitz/blindspin"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/kennethreitz/blindspin/archive/v${pkgver}.tar.gz")
md5sums=('6f55015f23549dc1c876b174be17fd62')
arch=('any')

package() {
  cd "$srcdir/blindspin-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  # No license file currently exists :(
  #mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  #cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
