# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python-roman
pkgver=3.3
pkgrel=2
pkgdesc="Integer to Roman numerals converter"
url="https://github.com/zopefoundation/roman"
makedepends=('python-setuptools')
license=('PSF')
arch=('any')
source=("roman-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('8846a7491dd9f59dc6bce1a950e055253804c6fcf11d14a088b4e2a7d6e4d29e')

build() {
  cd "${srcdir}/roman-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/roman-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 
}

