#Maintainer YangZhichao<1036711084@qq.com>

_pkgname=stua
pkgname=python-stua
pkgver=0.3.0
pkgrel=2
pkgdesc="A collection of generic python functions and classes, with no specific focus."
arch=('any')
url='https://github.com/rsalmaso/python-stua'
license=('MIT')
depends=(python)
makedepends=(python-setuptools)
checkdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/rsalmaso/python-stua/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4f833a1947447d0abf709607fb2b9a86b272d390202c6dfbbde1a08bd7ad8165')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}
