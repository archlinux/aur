# Maintainer: jdev082 <jdev0894@gmail.com>

pkgname=cutentr
pkgver=0.3.3
pkgrel=1
pkgdesc="POC Qt 3DS streaming client for NTR CFW"
arch=('x86_64')
url="https://gitlab.com/BoltsJ/cuteNTR"
license=('GPL3')
source=("https://gitlab.com/BoltsJ/cuteNTR/-/archive/${pkgver}/cuteNTR-${pkgver}.tar.gz")
md5sums=("ad8d9680139767818ea9d3dba09e27ff")

build() {
  cd "${srcdir}/cuteNTR-${pkgver}"
  qmake PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/cuteNTR-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}