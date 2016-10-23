# Maintainer: Husam Bilal <husam212 AT gmail DOT com>
_name=intervals
pkgname="python-${_name}"
pkgver=0.8.0
pkgrel=1
pkgdesc='Python tools for handling intervals (ranges of comparable objects).'
url='https://github.com/kvesteri/intervals'
depends=('python' 'python-infinity')
makedepends=('python')
license=('BSD')
arch=('any')
source=('https://pypi.python.org/packages/30/7a/7364356d073426b73014bc6f7aab36914fd9fc53e8d99150a0de69d7846a/intervals-0.8.0.tar.gz')
md5sums=('d2e7b132a4a00f001938cf47884b5e60')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
