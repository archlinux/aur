#Maintainer: Dylan Delgado (dylan1496 at live dot com)

pkgname=python-transitions
pkgver=0.9.1
pkgrel=1
pkgdesc="A lightweight, object-oriented finite state machine implementation in Python"
url="http://github.com/tyarkoni/transitions"
arch=(any)
license=('MIT')
makedepends=('python-setuptools')
depends=('python-six')
source=("https://github.com/tyarkoni/transitions/archive/${pkgver}.tar.gz")
sha256sums=('067bda2c498e8a4e5bc55e2b5e44a3fc9672c3ac6713f4de5e073a2758b6eef9')

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


