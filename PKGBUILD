#Maintainer: Dylan Delgado (dylan1496 at live dot com)

pkgname=python-transitions
pkgver=0.8.9
pkgrel=1
pkgdesc="A lightweight, object-oriented finite state machine implementation in Python"
url="http://github.com/tyarkoni/transitions"
arch=(any)
license=('MIT')
makedepends=('python-setuptools')
depends=('python-six')
source=("https://github.com/tyarkoni/transitions/archive/${pkgver}.tar.gz")
sha256sums=('7c5f1ca9912c3d680f5ff937124d1dc4506024cbb82c3d7480ea3a7fbd0b3e31')

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


