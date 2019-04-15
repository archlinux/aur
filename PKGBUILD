# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python-roman
pkgver=3.2
pkgrel=1
pkgdesc="Integer to Roman numerals converter"
url="https://github.com/zopefoundation/roman"
makedepends=('python-setuptools')
license=('PSF')
arch=('any')
source=("roman-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('0d7556d50e96d8762342f1336a19c77442c77aebfb756a9065d87298b99ca002')

build() {
  cd "${srcdir}/roman-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/roman-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 
}

