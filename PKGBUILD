# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python-roman
pkgver=2.0.0
pkgrel=1
pkgdesc="Integer to Roman numerals converter"
url="https://pypi.python.org/pypi/roman"
makedepends=('python-setuptools')
license=('PSF')
arch=('any')
source=("https://pypi.python.org/packages/source/r/roman/roman-${pkgver}.zip")
sha256sums=('90e83b512b44dd7fc83d67eb45aa5eb707df623e6fc6e66e7f273abd4b2613ae')

build() {
  cd "${srcdir}/roman-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/roman-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 
}

