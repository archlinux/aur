# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Michael Helmling <michaelhelmling@posteo.de>

pkgname=python-pytaglib
pkgver=1.4.6
pkgrel=4
pkgdesc='Python bindigs for the TagLib audio metadata library'
arch=(x86_64)
url="https://pypi.org/project/pytaglib"
license=('GPL3')
depends=(python taglib)
makedepends=(python-setuptools)
source=("https://pypi.org/packages/source/p/pytaglib/pytaglib-$pkgver.tar.gz")
sha256sums=('16daf54e78fb56442293d20d7659097470ecac9031f33037f9d53baa31382952')

build() {
  cd pytaglib-$pkgver
  python setup.py build
}

package() {
  cd pytaglib-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
