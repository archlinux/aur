# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=simplesoapy
_pkgname=simplesoapy
pkgver=1.5.0
pkgrel=1
pkgdesc="Simple pythonic wrapper for SoapySDR library"
arch=('any')
url="https://github.com/xmikos/simplesoapy"
license=('MIT')
depends=('python' 'python-numpy' 'soapysdr')
makedepends=('python-setuptools')
source=(https://github.com/xmikos/simplesoapy/archive/v$pkgver.tar.gz)
sha256sums=('9efde8cbcc3507d846d7250a89a5d58e39e09b62654b4b293db9f7d12913fc40')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
