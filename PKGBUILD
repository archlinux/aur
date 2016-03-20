# Maintainer: Husam Bilal <husam212 AT gmail DOT com>
_name=intervals
pkgname="python-${_name}"
pkgver=0.7.1
pkgrel=1
pkgdesc='Python tools for handling intervals (ranges of comparable objects).'
url='https://github.com/kvesteri/intervals'
depends=('python' 'python-infinity')
makedepends=('python')
license=('custom:UNLICENSE')
arch=('any')
source=("https://pypi.python.org/packages/source/i/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('d8e5abe117f3323b2de6568d1182ae57')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
