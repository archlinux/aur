# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=simplesoapy
_pkgname=simplesoapy
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple pythonic wrapper for SoapySDR library"
arch=('any')
url="https://github.com/xmikos/simplesoapy"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(https://github.com/xmikos/simplesoapy/archive/v$pkgver.tar.gz)
sha256sums=('683d811b49270903aaffce37c95e7674d6cfc2facac70f5a980951e11e70463e')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
