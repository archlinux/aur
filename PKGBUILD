# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=simplesoapy
_pkgname=simplesoapy
pkgver=1.2.0
pkgrel=1
pkgdesc="Simple pythonic wrapper for SoapySDR library"
arch=('any')
url="https://github.com/xmikos/simplesoapy"
license=('MIT')
depends=('python' 'python-numpy' 'soapysdr')
makedepends=('python-setuptools')
source=(https://github.com/xmikos/simplesoapy/archive/v$pkgver.tar.gz)
sha256sums=('62c35a88ac936450b735cef6b7e907401f37198a713af8b454c643f3bdc88495')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
