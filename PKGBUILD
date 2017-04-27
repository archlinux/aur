# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=simplesoapy
_pkgname=simplesoapy
pkgver=1.5.1
pkgrel=1
pkgdesc="Simple pythonic wrapper for SoapySDR library"
arch=('any')
url="https://github.com/xmikos/simplesoapy"
license=('MIT')
depends=('python' 'python-numpy' 'soapysdr')
makedepends=('python-setuptools')
source=(https://github.com/xmikos/simplesoapy/archive/v$pkgver.tar.gz)
sha256sums=('4006fb23997693266fbeee0b92d7461c3801c677a6dd2931a9539f34f37aa5b2')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
