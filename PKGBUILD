#Maintainer: Dylan Delgado (dylan1496 at live dot com)

pkgname=python-transitions
pkgver=0.9.3
pkgrel=1
pkgdesc="A lightweight, object-oriented finite state machine implementation in Python"
url="http://github.com/tyarkoni/transitions"
arch=(any)
license=('MIT')
makedepends=('python-setuptools')
depends=('python-six')
source=("https://github.com/tyarkoni/transitions/archive/${pkgver}.tar.gz")
sha256sums=('ccb8787bb9f669fee3cf628c62d35c6eeed14dc5256f6ab65294f7d38b29f94d')

prepare() {
  cd "${srcdir}"/transitions-$pkgver
}

build() {
  cd "${srcdir}"/transitions-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/transitions-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}


