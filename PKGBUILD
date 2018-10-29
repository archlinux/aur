# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python-roman
pkgver=3.1
pkgrel=1
pkgdesc="Integer to Roman numerals converter"
url="https://pypi.python.org/pypi/roman"
makedepends=('python-setuptools')
license=('PSF')
arch=('any')
source=("https://pypi.python.org/packages/source/r/roman/roman-${pkgver}.tar.gz")
sha256sums=('1643c2f7293f57de68e96d9fd1eea9de342f36f326f409a172f739c1b0fd24fb')

build() {
  cd "${srcdir}/roman-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/roman-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 
}

