# Maintainer: Tomas S. <me+aur at wereii.cz>
# Contributor: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python-roman
pkgver=4.0
pkgrel=1
pkgdesc="Integer to Roman numerals converter"
url="https://github.com/zopefoundation/roman"
makedepends=('python-setuptools')
license=('PSF')
arch=('any')
source=("roman-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('c4fc8d17a45a2b6560a0a8e0d113c2fb61c25b7a54b63368e99d56e6d0bce45b')

build() {
  cd "${srcdir}/roman-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/roman-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 
}

