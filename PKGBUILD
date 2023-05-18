# Maintainer: Tomas S. <me+aur at wereii.cz>
# Contributor: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python-roman
pkgver=4.2
pkgrel=1
pkgdesc="Integer to Roman numerals converter"
url="https://github.com/zopefoundation/roman"
makedepends=('python-setuptools')
license=('PSF')
arch=('any')
source=("roman-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('1b7daf7e6df4372630bb38e67d439368258d0c1f0f0708e6be9296b91c0efee2')

build() {
  cd "${srcdir}/roman-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/roman-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 
}

