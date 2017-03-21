# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=simplesoapy
_pkgname=simplesoapy
pkgver=1.3.0
pkgrel=1
pkgdesc="Simple pythonic wrapper for SoapySDR library"
arch=('any')
url="https://github.com/xmikos/simplesoapy"
license=('MIT')
depends=('python' 'python-numpy' 'soapysdr')
makedepends=('python-setuptools')
source=(https://github.com/xmikos/simplesoapy/archive/v$pkgver.tar.gz)
sha256sums=('f6ab435c1fed1d480084938cc2bdf4f6db1397b86f0c62c140dbca3d7e98f077')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
