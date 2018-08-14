# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python-roman
pkgver=3.0
pkgrel=1
pkgdesc="Integer to Roman numerals converter"
url="https://pypi.python.org/pypi/roman"
makedepends=('python-setuptools')
license=('PSF')
arch=('any')
source=("https://pypi.python.org/packages/source/r/roman/roman-${pkgver}.tar.gz")
sha256sums=('1cb1cfc9386ec39bd5dd3190c2c89c1b253140bccda16807aab3627cbb3f275d')

build() {
  cd "${srcdir}/roman-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/roman-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 
}

